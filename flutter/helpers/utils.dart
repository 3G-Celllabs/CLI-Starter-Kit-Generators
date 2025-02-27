import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Utilities {
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isiOS => !kIsWeb && Platform.isIOS;
  static bool get isWeb => kIsWeb;

  static DateTime get getCurrentTimestamp => DateTime.now();

  static String generateUUID() {
    return const Uuid().v4();
  }

  static bool isKeyboardOpen(BuildContext ctx) {
    return MediaQuery.of(ctx).viewInsets.bottom != 0;
  }

  static int doubleToInt(double value) {
    return value.round();
  }
}
