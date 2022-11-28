import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfaf_cart_module/core/themes/app_colors.dart';
import 'package:mfaf_cart_module/core/util/types.dart';
import 'package:mfaf_cart_module/presentation/bloc/address_query_bloc/address_query_bloc.dart';
import 'package:substring_highlight/substring_highlight.dart';

class LocationSuggestItem extends StatelessWidget {
  // Sub district > District > Province > Postal code

  const LocationSuggestItem(
      {super.key,
      this.subDistrict,
      this.district,
      this.province,
      this.postalCode,
      this.selectedIndex = 0,
      required this.addressSearchTypes});
  final dynamic subDistrict;
  final dynamic district;
  final dynamic province;
  final dynamic postalCode;
  final int selectedIndex;
  final AddressSearchTypes addressSearchTypes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: BlocBuilder<AddressQueryBloc, AddressQueryState>(
        builder: (context, state) {
          log('selectedIndex: ${state.selectedIndex}');
          final Color borderColor;
          final Color borderRadiusColor;

          if (state.selectedIndex == selectedIndex) {
            borderColor = AppColors.kLightGreen;
            borderRadiusColor = AppColors.kLightGreenShade2;
          } else {
            borderColor = Colors.transparent;
            borderRadiusColor = AppColors.kLightestGrey;
          }

          return Container(
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              color: borderRadiusColor,
            ),
            child: renderSearchBox(),
          );
        },
      ),
    );
  }

  Widget renderSearchBox() {
    switch (addressSearchTypes) {
      case AddressSearchTypes.subDistrict:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AddressQueryBloc, AddressQueryState>(
                builder: (context, state) {
                  return SubstringHighlight(
                    text: subDistrict.toString(),
                    term: state.query,
                    textStyleHighlight: const TextStyle(
                        // highlight style
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
              const Text('>'),
              Text('$district'),
              const Text('>'),
              Text('$province'),
              const Text('>'),
              Text('$postalCode'),
            ],
          );
        }

      case AddressSearchTypes.district:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('$subDistrict'),
              const Text('>'),
              BlocBuilder<AddressQueryBloc, AddressQueryState>(
                builder: (context, state) {
                  return SubstringHighlight(
                    text: district.toString(),
                    term: state.query,
                    textStyleHighlight: const TextStyle(
                        // highlight style
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
              const Text('>'),
              Text('$province'),
              const Text('>'),
              Text('$postalCode'),
            ],
          );
        }

      case AddressSearchTypes.province:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('$subDistrict'),
              const Text('>'),
              Text('$district'),
              const Text('>'),
              BlocBuilder<AddressQueryBloc, AddressQueryState>(
                builder: (context, state) {
                  return SubstringHighlight(
                    text: province.toString(),
                    term: state.query,
                    textStyleHighlight: const TextStyle(
                        // highlight style
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
              const Text('>'),
              Text('$postalCode'),
            ],
          );
        }

      case AddressSearchTypes.postalCode:
        {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('$subDistrict'),
              const Text('>'),
              Text('$district'),
              const Text('>'),
              Text('$province'),
              const Text('>'),
              BlocBuilder<AddressQueryBloc, AddressQueryState>(
                builder: (context, state) {
                  return SubstringHighlight(
                    text: postalCode.toString(),
                    term: state.query,
                    textStyleHighlight: const TextStyle(
                        // highlight style
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            ],
          );
        }
    }
  }
}
