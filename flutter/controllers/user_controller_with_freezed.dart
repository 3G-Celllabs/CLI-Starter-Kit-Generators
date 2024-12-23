import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../constants.dart';

class UserController extends GetxController {
  UserController({required this.storageService});

  final StorageService storageService;
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
    final data = storageService.getData(Constants.userDetailsInStorage);
    if (data != null) {
      user.value = User.fromJson(data);
    }
  }

  _handleValueChange(User value) {
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
      // () => Get.toNamed(Constants.loginRoute),
    );
  }

  _redirectToHome() {
    Future.delayed(
      const Duration(seconds: 1),
      () => Get.offAllNamed(Constants.homeRoute),
    );
  }
}