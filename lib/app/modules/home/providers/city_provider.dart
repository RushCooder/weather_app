import 'dart:convert';

import 'package:http/http.dart' as http;

class CityProvider {
  // data getting from weather api
  Future<List<dynamic>> getCityDetails() async {
    // requesting api with get method
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://api.openweathermap.org/data/2.5/find?lat=23.68&lon=90.35&cnt=50&appid=e384f9ac095b2109c751d95296f8ea76'));
    // storing response from api in response variable
    http.StreamedResponse response = await request.send();

    // checking api response status
    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var mapData = jsonDecode(data);
      return mapData["list"];
    } else {
      return Future.error(response.reasonPhrase.toString());
    }
  }
}
