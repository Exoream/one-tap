import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:ecommerce/routes/routes_named.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();
      final bool hasSeenGetStarted =
          prefs.getBool('hasSeenGetStarted') ?? false;

      if (hasSeenGetStarted) {
        Get.offNamed(RoutesNamed.login);
      } else {
        Get.offNamed(RoutesNamed.onboarding);
        await prefs.setBool('hasSeenGetStarted', true);
      }
    });

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              child: Image.asset(
                'assets/img/icon.png',
                height: 150.0,
                width: 150.0,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'OneTap',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
