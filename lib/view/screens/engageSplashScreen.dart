import 'package:engage/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: Lottie.asset(
        'assets/splash_lottie.json',
        controller: _controller,
        height: Get.size.height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(
              () {
                Get.put(AuthController());
              },
            );
        },
      ),
    );
  }
}
