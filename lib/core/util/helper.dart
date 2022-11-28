import 'package:flutter/cupertino.dart';

class Helper {
  static final Helper _singleton = Helper._internal();

  factory Helper() {
    return _singleton;
  }

  Helper._internal();

  static bool isElementHasVal(List<String?> params) {
    bool result = true;
    for (var value in params) {
      if (value == null || value.isEmpty) {
        debugPrint('isElementHasVal failed: $value');
        result = false;
      } else {
        debugPrint('isElementHasVal valid: $value');
      }
    }

    return result;
  }
}
