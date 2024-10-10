import 'package:app/routes.dart';
import 'package:app/theme.dart';
import 'package:app/utilities/constants.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.lightTheme(context),
      initialRoute: Routes.splash,
      getPages: routes,
    );
  }
}

class MyAppWithDevicePreview extends StatelessWidget {
  const MyAppWithDevicePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      initialRoute: Routes.splash,
      getPages: routes,
    );
  }
}
