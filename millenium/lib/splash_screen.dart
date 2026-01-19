import 'package:flutter/material.dart';
import 'package:millenium/auth.dart';
import 'package:millenium/onboarding_screen.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      _checkOnboarding();
    });
  }

  void _checkOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

    if (seenOnboarding) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const AuthMainScreen()));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const OnboardingPage()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: MediaQuery.of(context).size.width * 0.5,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}