import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather app",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        // primary color for the app
        primarySwatch: MaterialColor(
          0xFF00804A,
          {
            50: Color(0xFF00804A),
            100: Color(0xFF00804A),
            200: Color(0xFF00804A),
            300: Color(0xFF00804A),
            400: Color(0xFF00804A),
            500: Color(0xFF00804A),
            600: Color(0xFF00804A),
            700: Color(0xFF00804A),
            800: Color(0xFF00804A),
            900: Color(0xFF00804A),
          },
        ),
      ),
    ),
  );
}
