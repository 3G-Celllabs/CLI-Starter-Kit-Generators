import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppTextSpan {
  static TextSpan heading(
    BuildContext context, {
    required String text,
    Color? color,
    double fontSize = 24.0,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextSpan(
      text: text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: color ?? Theme.of(context).colorScheme.onSurface,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
    );
  }

  static TextSpan subHeading(
    BuildContext context, {
    required String text,
    Color? color,
    FontWeight? fontWeight,
    GestureRecognizer? recognizer,
  }) {
    return TextSpan(
      text: text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: color ?? Theme.of(context).colorScheme.onSecondary,
            fontWeight: fontWeight,
          ),
      recognizer: recognizer,
    );
  }

  static TextSpan body(
    BuildContext context, {
    required String text,
    Color? color,
    fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration decoration = TextDecoration.none,
    GestureRecognizer? recognizer,
  }) {
    return TextSpan(
      text: text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: color ?? Theme.of(context).colorScheme.onPrimary,
            decoration: decoration,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
      recognizer: recognizer,
    );
  }

  static TextSpan label(
    BuildContext context, {
    required String text,
    Color? color,
    TextDecoration decoration = TextDecoration.lineThrough,
    fontWeight = FontWeight.bold,
  }) {
    return TextSpan(
      text: text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: color ?? Theme.of(context).colorScheme.onPrimary,
            decoration: decoration,
            fontWeight: fontWeight,
          ),
    );
  }
}
