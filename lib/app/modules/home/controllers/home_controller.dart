import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/home/providers/city_provider.dart';
import '../../../data/extensions.dart';

class HomeController extends GetxController {
  // observe variables
  Rxn<List<dynamic>> cityDetails = Rxn<List<dynamic>>();
  var isLoading = false.obs;
  var connectionStatus = false.obs;

  @override
  void onInit() {
    super.onInit();
    // cheacking connection
    checkConnection();
  }

  // connection checking function
  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    }
    if (connectivityResult == ConnectivityResult.none) {
      connectionStatus.value = false;
    } else {
      connectionStatus.value = true;
      // calling weather api for data
      getData();
    }
  }

  // get data function from weather api
  void getData() async {
    isLoading(true);
    try {
      cityDetails.value = await CityProvider().getCityDetails();
      isLoading(false);
    } catch (e) {
      Get.snackbar(
        "Error",
        "No Internet",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      isLoading.value = false;
    }
  }

  // capitalizing text
  String capitalizeFirstLater(String input) {
    var splitInput = input.split(" ");
    var capitalizedText = [];
    for (String sp in splitInput) {
      capitalizedText.add(sp.toCapital());
    }
    return capitalizedText.join(" ");
  }

  // convert kelvin temp. to celsius
  int getTemparetur(temp) {
    return (temp - 273.15).toInt();
  }
}
