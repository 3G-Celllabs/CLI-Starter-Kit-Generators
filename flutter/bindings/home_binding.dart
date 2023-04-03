import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommonController>(() => CommonController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
