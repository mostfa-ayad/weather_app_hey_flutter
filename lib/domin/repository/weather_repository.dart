import 'package:dartz/dartz.dart';
import 'package:weather_app_hey_flutter/core/error/failure.dart';
import 'package:weather_app_hey_flutter/domin/entity/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getWeatherStatuesByCityName(String cityName);
}
