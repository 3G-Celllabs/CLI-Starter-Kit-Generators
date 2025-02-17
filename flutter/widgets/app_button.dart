import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.clickHandler,
    required this.label,
    this.btnStyle,
    this.isDisabled = false,
    this.isPrimary,
    this.labelStyle,
    this.minimumSize,
    this.padding = const EdgeInsets.symmetric(
      horizontal: 36.0,
      vertical: 10.0,
    ),
    super.key,
  });

  final ButtonStyle? btnStyle;
  final void Function()? clickHandler;
  final bool isDisabled;
  final bool? isPrimary;
  final Widget label;
  final TextStyle? labelStyle;
  final Size? minimumSize;
  final EdgeInsetsGeometry? padding;

  factory AppButton.primary(
    BuildContext context, {
    Color? bg,
    double borderRadius = 12.0,
    required clickHandler,
    Color? fg,
    bool isDisabled = false,
    required label,
    Size? minimumSize = const Size(double.infinity, 60.0),
    EdgeInsetsGeometry? padding,
  }) =>
      AppButton(
        btnStyle: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              minimumSize: WidgetStatePropertyAll(minimumSize),
              padding: WidgetStatePropertyAll(padding),
            ),
        clickHandler: clickHandler,
        isDisabled: isDisabled,
        isPrimary: true,
        label: AppText.subHeading16(
          context,
          text: label,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.surface,
        ),
        minimumSize: minimumSize,
        padding: padding,
      );

  factory AppButton.secondary(
    BuildContext context, {
    Color? bg,
    double borderRadius = 12.0,
    required clickHandler,
    Color? fg,
    bool isDisabled = false,
    required label,
    Size? minimumSize = const Size(double.infinity, 60.0),
    EdgeInsetsGeometry? padding,
  }) =>
      AppButton(
        btnStyle: Theme.of(context).outlinedButtonTheme.style?.copyWith(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
              side: WidgetStatePropertyAll<BorderSide>(
                BorderSide(
                  color: bg ?? Theme.of(context).colorScheme.primary,
                  width: 1.0,
                ),
              ),
              minimumSize: WidgetStatePropertyAll(minimumSize),
              padding: WidgetStatePropertyAll(padding),
            ),
        clickHandler: clickHandler,
        isDisabled: isDisabled,
        isPrimary: false,
        label: AppText.subHeading16(
          context,
          text: label,
          color: fg ?? Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w400,
        ),
        minimumSize: minimumSize,
        padding: padding,
      );

  factory AppButton.tertiary(
    BuildContext context, {
    required clickHandler,
    required label,
    bool isDisabled = false,
    Size? minimumSize = const Size(double.infinity, 60.0),
    EdgeInsetsGeometry? padding,
  }) =>
      AppButton(
        btnStyle: Theme.of(context).outlinedButtonTheme.style?.copyWith(
              minimumSize: WidgetStatePropertyAll(minimumSize),
              padding: WidgetStatePropertyAll(padding),
              side: WidgetStatePropertyAll<BorderSide>(
                BorderSide(
                  color: Theme.of(context).colorScheme.onTertiary,
                  width: 1.0,
                ),
              ),
            ),
        clickHandler: clickHandler,
        isDisabled: isDisabled,
        isPrimary: false,
        label: AppText.subHeading16(
          context,
          text: label,
          color: Theme.of(context).colorScheme.onSecondary,
          fontWeight: FontWeight.w400,
        ),
        minimumSize: minimumSize,
        padding: padding,
      );

  @override
  Widget build(BuildContext context) {
    void Function()? onPressed = isDisabled ? null : clickHandler;

    Widget widget;
    switch (isPrimary) {
      case null:
        widget = _buildDefaultButton(onPressed);
        break;
      case true:
        widget = _buildPrimaryButton(onPressed);
        break;
      case false:
        widget = _buildSecondaryButton(onPressed);
        break;
    }
    return widget;
  }

  Widget _buildDefaultButton(onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: btnStyle,
      child: label,
    );
  }

  Widget _buildPrimaryButton(onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: btnStyle,
      child: label,
    );
  }

  Widget _buildSecondaryButton(onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      style: btnStyle,
      child: label,
    );
  }
}
