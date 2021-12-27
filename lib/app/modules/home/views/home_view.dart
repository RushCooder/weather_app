import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeatherApp'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.connectionStatus.value == false
            // Cheacking internet connection
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Internet Connection"),
                    ElevatedButton(
                      onPressed: () {
                        controller.checkConnection();
                      },
                      child: Text("Refresh"),
                    ),
                  ],
                ),
              )
            // checking data is available or not
            : controller.isLoading.value == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                // List of city with weather info
                : ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: controller.cityDetails.value!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // navigating to map page
                          Get.toNamed(Routes.WEATHER_MAP,
                              arguments: controller.cityDetails.value![index]);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: index == 0 ? 20 : 10,
                            bottom: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.cityDetails.value![index]
                                        ['name'],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    controller.capitalizeFirstLater(
                                      controller
                                          .cityDetails
                                          .value![index]['weather'][0]
                                              ["description"]
                                          .toString(),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        controller
                                            .getTemparetur(controller
                                                .cityDetails
                                                .value![index]['main']['temp'])
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          "°",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Text(
                                          "C",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
