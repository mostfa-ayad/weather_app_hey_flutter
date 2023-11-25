import 'dart:convert';

import 'package:weather_app_hey_flutter/core/config.dart';
import 'package:weather_app_hey_flutter/domin/entity/weather.dart';
import 'package:http/http.dart' as http;

abstract class WeatherDatasource {
  Future<Weather> getWeatherStatuesByCityName(String cityName);
}

class WeatherOpenApiDatasource implements WeatherDatasource {
  @override
  Future<Weather> getWeatherStatuesByCityName(String cityName) async {
    var response = await http.get(Uri.parse(
        "http://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$AppWeatherKey&units=imperial"));
    var data = jsonDecode(response.body);
    Weather weather = Weather.fromMap(data);
    print(weather);
    return weather;
  }
}
