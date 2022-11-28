import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfaf_cart_module/core/themes/app_colors.dart';
import 'package:mfaf_cart_module/core/util/types.dart';
import 'package:mfaf_cart_module/core/widgets/cubit/textfield_valid_cubit/cubit/textfield_valid_cubit.dart';
import 'package:mfaf_cart_module/injection.dart' as di;

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.controller,
    this.onTap,
    this.isOptional,
  });
  final String title;
  final String hintText;
  final InputTextOnSaved? onSaved;
  final InputTextOnValidate? validator;
  final InputTextOnChanged? onChanged;
  final InputTextOnTap? onTap;
  final bool? isOptional;
  final TextEditingController? controller;

  //bool _isValid = true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.locator<TextfieldValidCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey.shade700),
          ),
          const SizedBox(
            height: 10.0,
          ),
          BlocBuilder<TextfieldValidCubit, TextfieldValidState>(
            builder: (context, state) {
              return Focus(
                onFocusChange: (hasFocus) {
                  if (!hasFocus) {
                    if (controller!.text.isEmpty) {
                      //_isValid = true;
                      context.read<TextfieldValidCubit>().invalid();
                      controller!.text = ' ';
                      controller!.text = '';
                    }
                  }
                },
                child: TextFormField(
                  onTap: onTap,
                  controller: controller,
                  validator: (value) {
                    if (isOptional != null && isOptional == true) {
                      //_isValid = true;
                      context.read<TextfieldValidCubit>().valid();
                      return null;
                    }

                    if (value == null || value.isEmpty) {
                      //_isValid = false;
                      context.read<TextfieldValidCubit>().invalid();
                    } else {
                      //_isValid = true;
                      context.read<TextfieldValidCubit>().valid();
                    }

                    String? retValue;
                    if (validator != null) {
                      retValue = validator!(value);
                    } else {
                      retValue = defaultValidator(value);
                    }

                    return retValue;
                  },
                  onSaved: (newValue) {
                    onSaved!(newValue);
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      //_isValid = false;
                      context.read<TextfieldValidCubit>().invalid();
                    } else {
                      // _isValid = true;
                      context.read<TextfieldValidCubit>().valid();
                    }

                    if (isOptional != null && isOptional == true) {
                      // _isValid = true;
                      context.read<TextfieldValidCubit>().valid();
                    }
                    //setState(() {});

                    if (onChanged != null) {
                      onChanged!(value);
                    }
                  },
                  decoration: InputDecoration(
                    errorMaxLines: 2,
                    border: const OutlineInputBorder(),
                    suffixIcon: !state.isValid
                        ? Image.asset('assets/images/icons/Exclamation.png')
                        : null,
                    suffixIconColor: Colors.amber,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.kLightGreen,
                      ),
                    ),
                    hintText: hintText,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  String? defaultValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please fill out the information completely.';
    }
    return null;
  }
}
