import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppTextSpan {
  static TextSpan heading({
    required String text,
    Color? color,
    double fontSize = 24.0,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextSpan(
      text: text,
      style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
            color: color ?? Theme.of(Get.context!).colorScheme.onSurface,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
    );
  }

  static TextSpan subHeading({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    GestureRecognizer? recognizer,
  }) {
    return TextSpan(
      text: text,
      style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(
            color: color ?? Theme.of(Get.context!).colorScheme.onSecondary,
            fontWeight: fontWeight,
          ),
      recognizer: recognizer,
    );
  }

  static TextSpan body({
    required String text,
    Color? color,
    fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration decoration = TextDecoration.none,
    GestureRecognizer? recognizer,
  }) {
    return TextSpan(
      text: text,
      style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
            color: color ?? Theme.of(Get.context!).colorScheme.onPrimary,
            decoration: decoration,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
      recognizer: recognizer,
    );
  }

  static TextSpan label({
    required String text,
    Color? color,
    TextDecoration decoration = TextDecoration.lineThrough,
    fontWeight = FontWeight.bold,
  }) {
    return TextSpan(
      text: text,
      style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
            color: color ?? Theme.of(Get.context!).colorScheme.onPrimary,
            decoration: decoration,
            fontWeight: fontWeight,
          ),
    );
  }
}
