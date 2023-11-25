import 'package:get_it/get_it.dart';
import 'package:weather_app_hey_flutter/data/datasource/weather_datasource.dart';
import 'package:weather_app_hey_flutter/data/repository/weather_repository_impl.dart';
import 'package:weather_app_hey_flutter/domin/repository/weather_repository.dart';
import 'package:weather_app_hey_flutter/domin/usecase/get_weather_by_city_name_usecase.dart';
import 'package:weather_app_hey_flutter/presentition/bloc/weather_bloc.dart';

var di = GetIt.instance;

setup() {
  di.registerFactory(() => WeatherBloc(getWeatherByCityNameUsecase: di()));
  di.registerLazySingleton(() => GetWeatherByCityNameUsecase(repository: di()));
  di.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(datasource: di()));
  di.registerLazySingleton<WeatherDatasource>(() => WeatherOpenApiDatasource());
}
