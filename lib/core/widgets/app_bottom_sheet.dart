import 'package:flutter/material.dart';

Future<T?> popAddressSearch<T>(BuildContext context, Widget widget) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        // <-- SEE HERE
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      builder: (context) {
        return widget;
      });
}
