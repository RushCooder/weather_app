import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/app/modules/weather_map/views/components/text_component.dart';

import '../controllers/weather_map_controller.dart';

class WeatherMapView extends GetView<WeatherMapController> {
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller = Completer();
    return Scaffold(
      appBar: AppBar(
        title: Text('WeatherApp'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.homeController.connectionStatus.value == false
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Internet Connection"),
                    ElevatedButton(
                      onPressed: () {
                        controller.homeController.checkConnection();
                      },
                      child: Text("Refresh"),
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: GoogleMap(
                        mapToolbarEnabled: false,
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                            controller.weatherInfo.value!["coord"]['lat'],
                            controller.weatherInfo.value!["coord"]['lon'],
                          ),
                          zoom: 14.4746,
                        ),
                        markers: {
                          Marker(
                            markerId: MarkerId("_KGoogleMarker"),
                            infoWindow: InfoWindow(
                                title: controller.weatherInfo.value!["name"]),
                            position: LatLng(
                                controller.weatherInfo.value!["coord"]['lat'],
                                controller.weatherInfo.value!["coord"]['lon']),
                            icon: BitmapDescriptor.defaultMarker,
                          )
                        },
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextComponent(
                              title: controller.weatherInfo.value!['name'],
                              isBold: true,
                              fontSize: 20,
                            ),
                            TextComponent(
                              title: controller.homeController
                                  .capitalizeFirstLater(controller.weatherInfo
                                      .value!['weather'][0]['description']),
                            ),
                            TextComponent(
                              title:
                                  "Humidity: ${controller.weatherInfo.value!['main']['humidity']}",
                            ),
                            TextComponent(
                              title:
                                  "Wind Speed: ${controller.weatherInfo.value!['wind']['speed']}",
                            ),
                            TextComponent(
                              title:
                                  "Max. Temp.: ${controller.homeController.getTemparetur(controller.weatherInfo.value!['main']['temp_max'])}℃",
                            ),
                            TextComponent(
                              title:
                                  "Min. Temp.: ${controller.homeController.getTemparetur(controller.weatherInfo.value!['main']['temp_min'])}℃",
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${controller.homeController.getTemparetur(controller.weatherInfo.value!['main']['temp'])}",
                                  style: TextStyle(
                                    fontSize: 32,
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
                            Icon(
                              controller.weatherInfo.value!['weather'][0]
                                          ['main'] ==
                                      'Clear'
                                  ? Icons.cloud_outlined
                                  : controller.weatherInfo.value!['weather'][0]
                                              ['main'] ==
                                          'Clouds'
                                      ? Icons.cloud
                                      : Icons.cloud_circle_sharp,
                              size: MediaQuery.of(context).size.width * 0.2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
