import 'dart:convert';

import 'package:control_clima/models/forecast.dart';
import 'package:control_clima/models/location.dart';
import 'package:http/http.dart' as http;

class OpenWeatherMapApi {
  String url = 'https://api.openweathermap.org/data/2.5/';
  String apikey = 'b79de120aa2ccf5bcc6df030002cd450';

  Future<Location> getLocation(String city) async {
    var response = await http.get('${url}weather?q=$city&appid=$apikey');
    if (response.statusCode != 200) {
      throw Exception(response.body.toString());
    }
    return Location.fromJson(jsonDecode(response.body));
  }

  Future<Forecast> getForecast(Location location) async {
    var response = await http.get(
        "${url}onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=hourly,minutely&appid=$apikey");
    if (response.statusCode != 200) {
      throw Exception(response.body.toString());
    }
    return Forecast.fromJson(jsonDecode(response.body));
  }
}
