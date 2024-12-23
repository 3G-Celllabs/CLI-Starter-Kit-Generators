import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:device_preview/device_preview.dart';
import 'constants.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");
  await GetStorage.init();

  if (kDebugMode) {
    runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyAppWithDevicePreview(),
      ),
    );
  } else {
    runApp(const MyApp());
  }
}