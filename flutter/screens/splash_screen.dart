import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Splash Screen'),
        ),
      ),
    );
  }
}
