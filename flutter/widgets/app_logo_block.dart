import 'dart:math';
import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

class AppLogoBlock extends StatelessWidget {
  const AppLogoBlock({this.width, this.height, super.key});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    double defaultWidth = max(MediaQuery.of(context).size.width * 0.3, 160.0);
    return Hero(
      tag: UIConstants.heroTag,
      child: SizedBox(
        width: width ?? defaultWidth,
        height: height ?? defaultWidth,
        child: Center(
          child: AppImage.asset(
            path: getPath(context),
          ),
        ),
      ),
    );
  }

  String getPath(BuildContext context) {
    String path = '';
    if (MediaQuery.of(context).platformBrightness == Brightness.light) {
      path = Images.logo;
    } else {
      path = Images.logo;
    }
    return path;
  }
}
