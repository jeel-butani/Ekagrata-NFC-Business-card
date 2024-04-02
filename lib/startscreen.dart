import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mu_card/dashboard.dart';
import 'package:mu_card/login/welcomemobile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogin = prefs.getBool('isLogin') ?? false;
      int id = prefs.getInt('userId') ?? 0;
      if (isLogin && id != 0) {
        Get.off(() => Dashboard(userId: id));
      } else {
        Get.off(() => WelcomeMobile());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // stops: [0.5, 0.5],
        colors: [
          // Color.fromARGB(255, 0, 255, 251),
          Colors.grey,
          Colors.white
        ],
      )),
      child: Image.asset(
        'assets/images/logo.png',
        width: 300,
      ),
    );
  }
}
