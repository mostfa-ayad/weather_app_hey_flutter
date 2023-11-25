import 'package:dartz/dartz.dart';

import 'package:weather_app_hey_flutter/core/error/failure.dart';
import 'package:weather_app_hey_flutter/data/datasource/weather_datasource.dart';
import 'package:weather_app_hey_flutter/domin/entity/weather.dart';
import 'package:weather_app_hey_flutter/domin/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherDatasource datasource;
  WeatherRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<Failure, Weather>> getWeatherStatuesByCityName(
      String cityName) async {
    try {
      return Right(await datasource.getWeatherStatuesByCityName(cityName));
    } on ServerException catch (e) {
      return Left(Failure(msg: e.msg));
    }
  }
}
