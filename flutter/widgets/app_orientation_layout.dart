import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppOrientationLayout extends StatelessWidget {
  const AppOrientationLayout({
    super.key,
    required this.portrait,
    required this.landscape,
  });

  final Widget portrait;
  final Widget landscape;

  @override
  Widget build(BuildContext context) {
    return OrientationLayoutBuilder(
      portrait: (context) => portrait,
      landscape: (context) => landscape,
    );
  }
}
