import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => Get.toNamed(homeScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Images.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
            width: 200.0,
            height: 200.0,
          ),
        ),
      ),
    );
  }
}
