import 'package:get/get.dart';

import '../controllers/weather_map_controller.dart';

class WeatherMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherMapController>(
      () => WeatherMapController(),
    );
  }
}
