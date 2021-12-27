import 'dart:async';

import 'package:get/get.dart';
import 'package:weather_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  var test = "WeatherApp".obs;
  @override
  void onInit() {
    super.onInit();
    Timer(
      Duration(seconds: 3),
      () {
        // navigating to home page
        Get.offAndToNamed(Routes.HOME);
      },
    );
  }
}
