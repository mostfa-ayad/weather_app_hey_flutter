part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadListState extends WeatherState {
  List<Weather> list;
  WeatherLoadListState({
    required this.list,
  });

  @override
  List<Object> get props => [list];
}

class WeatherErrorState extends WeatherState {
  String msg;
  WeatherErrorState({
    required this.msg,
  });
  @override
  List<Object> get props => [msg];
}
