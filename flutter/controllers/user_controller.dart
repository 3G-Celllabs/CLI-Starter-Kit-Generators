import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../constants.dart';

class UserController extends GetxController {
  final Rxn<User> user = Rxn<User>();
  final appVersion = ''.obs;

  @override
  void onInit() {
    super.onInit();
    ever(user, (value) => _handleValueChange(value));
    fetchAppVersion();
  }

  fetchAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
  }

  updateUser(User newUser) {
    user.value = newUser;
  }

  logoutUser() {
    user.value = null;
  }

  _evaluateUserFromStorage() {
    final data = StorageService.getData(Constants.userDetailsInStorage);
    if (data != null) {
      user.value = User.fromJson(data);
    }
  }

  _handleValueChange(User? value) {
    if (user.value != null) {
      _redirectToHome();
    } else {
      _redirectToLogin();
    }
  }

  _redirectToLogin() {
    Future.delayed(
      const Duration(seconds: 1),
      // () => Get.toNamed(Constants.loginRoute),
    );
  }

  _redirectToHome() {
    Future.delayed(
      const Duration(seconds: 1),
      // () => Get.offAllNamed(Constants.dashboardRoute),
    );
  }
}