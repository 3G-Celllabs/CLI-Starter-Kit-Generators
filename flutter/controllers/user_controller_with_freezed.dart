// import 'package:app/auth/login/models/user/user.dart';
// import 'package:app/dashboard/nav/nav_controller.dart';
// import 'package:app/routes.dart';
// import 'package:app/utilities/constants.dart';
// import 'package:app/utilities/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UserController extends GetxController {
  final user = (const UnknownUser() as User).obs;
  final appVersion = ''.obs;

  @override
  void onInit() {
    super.onInit();
    ever(user, (value) => _handleValueChange(value));
    user.value = const User.unknown();
    fetchAppVersion();

    // _evaluateUserFromStorage();
  }

  fetchAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
  }

  updateUser(User newUser) {
    user.value = newUser;
  }

  logoutUser() {
    user.value = const User.invalid();
  }

  _evaluateUserFromStorage() {
    final data = StorageService.getData(Constants.userDetailsInStorage);
    if (data != null) {
      user.value = User.fromJson(data);
    }
  }

  _handleValueChange(User value) {
    debugPrint(value.toString());
    switch (value) {
      case ValidUser():
        _redirectToHome();
        break;
      default:
        _redirectToLogin();
    }
  }

  _redirectToLogin() {
    Future.delayed(
      const Duration(seconds: 1),
      // () => Get.toNamed(Routes.login),
    );
  }

  _redirectToHome() {
    Future.delayed(
      const Duration(seconds: 1),
      () => Get.offAllNamed(Routes.dashboard),
    );
  }
}
