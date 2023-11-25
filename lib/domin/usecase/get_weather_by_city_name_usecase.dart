import 'package:dartz/dartz.dart';

import 'package:weather_app_hey_flutter/core/error/failure.dart';
import 'package:weather_app_hey_flutter/domin/entity/weather.dart';
import 'package:weather_app_hey_flutter/domin/repository/weather_repository.dart';

class GetWeatherByCityNameUsecase {
  WeatherRepository repository;
  GetWeatherByCityNameUsecase({
    required this.repository,
  });
  Future<Either<Failure, Weather>> call(String cityName) {
    return repository.getWeatherStatuesByCityName(cityName);
  }
}
