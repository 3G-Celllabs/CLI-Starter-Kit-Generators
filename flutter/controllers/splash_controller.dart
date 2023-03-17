import 'package:get/state_manager.dart';

class SplashController extends GetxController {
  final isSplash = true.obs;

  void updateIsSplash(bool newValue) => isSplash.value = newValue;
}
