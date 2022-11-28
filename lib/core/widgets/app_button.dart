import 'package:flutter/material.dart';
import 'package:mfaf_cart_module/core/util/types.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.bgColor,
    required this.textColor,
    this.borderColor,
    this.onPressed,
    this.enableSplash = true,
  });
  final String title;
  final Color bgColor;
  final Color textColor;
  final Color? borderColor;
  final SubmitButtonOnPressed? onPressed;
  final bool enableSplash;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          splashFactory: enableSplash ? null : NoSplash.splashFactory,
          shape: const StadiumBorder(),
          backgroundColor: bgColor,
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
    );
  }
}
