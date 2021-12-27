import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            '${controller.test}',
            style: TextStyle(
                fontSize: 30,
                color: Color(0xFF00804A),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
