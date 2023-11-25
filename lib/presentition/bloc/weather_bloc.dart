import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_hey_flutter/core/data.dart';
import 'package:weather_app_hey_flutter/domin/entity/weather.dart';

import 'package:weather_app_hey_flutter/domin/usecase/get_weather_by_city_name_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  String selectedCity = DATABASE_CITY_LIST[0];
  GetWeatherByCityNameUsecase getWeatherByCityNameUsecase;
  WeatherBloc({
    required this.getWeatherByCityNameUsecase,
  }) : super(WeatherInitial()) {
    on<WeatherLoadList>((event, emit) {
      emit(WeatherLoadingState());

      String errorMsg = "";
      List<Weather> list = [];
      DATABASE_CITY_LIST.forEach((element) async {
        var either = await getWeatherByCityNameUsecase.call(element);
        either.fold((l) => "$errorMsg # ${l.msg}", (r) => list.add(r));
      });
      print(errorMsg);
      if (errorMsg.isEmpty) {
        emit(WeatherLoadListState(list: list));
      } else {
        emit(WeatherErrorState(msg: errorMsg));
      }
    });
  }
}
