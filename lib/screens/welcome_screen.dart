import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo and Tagline
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100.0,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Empowering Holistic Child Growth',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              // Sign Up and Log In Buttons
              ElevatedButton(
                onPressed: () {
                  // Navigate to Sign Up screen
                  Get.toNamed('/signup');
                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Log In screen
                  Get.toNamed('/login');
                },
                child: const Text('Log In'),
              ),
              const SizedBox(height: 16.0),
              // Explore Features Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to Explore Features screen
                  Get.toNamed('/explore');
                },
                child: const Text('Explore Features'),
              ),
              const SizedBox(height: 32.0),
              // Call-to-Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to Get Started screen
                      Get.toNamed('/get-started');
                    },
                    child: const Text('Get Started'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to Sign In screen
                      Get.toNamed('/sign-in');
                    },
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
