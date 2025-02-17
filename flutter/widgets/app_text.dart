import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  factory AppText.heading24(
    BuildContext context, {
    required String text,
    TextAlign textAlign = TextAlign.center,
    FontWeight? fontWeight,
    Color? color,
  }) =>
      AppText(
        text: text,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: color,
              fontWeight: fontWeight,
            ),
        textAlign: textAlign,
      );

  factory AppText.heading20(
    BuildContext context, {
    required String text,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
  }) =>
      AppText(
        text: text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: color,
              fontWeight: fontWeight,
            ),
        textAlign: textAlign,
      );

  factory AppText.subHeading16(
    BuildContext context, {
    required String text,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
  }) =>
      AppText(
        text: text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: fontWeight,
            ),
        textAlign: textAlign,
      );

  factory AppText.bold(BuildContext context,
          {required String text,
          TextAlign? textAlign,
          Color? color,
          double? fontSize}) =>
      AppText(
        text: text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: color,
              fontSize: fontSize,
            ),
        textAlign: textAlign,
      );

  factory AppText.body14(
    BuildContext context, {
    required String text,
    TextAlign textAlign = TextAlign.center,
    Color? color,
    FontWeight? fontWeight,
  }) =>
      AppText(
        text: text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
              fontWeight: fontWeight,
            ),
        textAlign: textAlign,
      );

  factory AppText.label12(
    BuildContext context, {
    required String text,
    TextAlign? textAlign,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) =>
      AppText(
        text: text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
        textAlign: textAlign,
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      softWrap: true,
    );
  }
}
