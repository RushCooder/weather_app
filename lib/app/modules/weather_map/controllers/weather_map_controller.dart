import 'package:get/get.dart';
import 'package:weather_app/app/modules/home/controllers/home_controller.dart';

class WeatherMapController extends GetxController {
  // observ variable
  Rxn<Map<String, dynamic>> weatherInfo = Rxn<Map<String, dynamic>>();
  // normal variable
  HomeController homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    // checking internet connection
    homeController.checkConnection();
    // getting data from home page
    weatherInfo.value = Get.arguments;
  }
}
