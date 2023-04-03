import 'package:get/state_manager.dart';

class CommonController extends GetxController {
  final _isSplash = true.obs;

  bool get isSplash => _isSplash.value;

  void updateIsSplash(bool newValue) => _isSplash.value = newValue;
}
