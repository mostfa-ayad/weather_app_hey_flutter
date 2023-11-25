import 'dart:convert';

import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  String main;
  String description;
  String icon;
  double temp;
  int pressure;
  int humidity;
  double wind;
  String city;
  Weather({
    required this.city,
    required this.main,
    required this.description,
    required this.icon,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.wind,
  });
  @override
  // TODO: implement props
  List<Object> get props {
    return [main, description, icon, temp, pressure, humidity, wind, city];
  }

  Weather copyWith(
      {String? main,
      String? description,
      String? icon,
      double? temp,
      int? pressure,
      int? humidity,
      double? wind,
      String? city}) {
    return Weather(
      main: main ?? this.main,
      city: city ?? this.city,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      wind: wind ?? this.wind,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'main': main,
      'description': description,
      'icon': icon,
      'temp': temp,
      'pressure': pressure,
      'humidity': humidity,
      'wind': wind,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      main: map["weather"][0]['main'] ?? '',
      description: map["weather"][0]['description'] ?? '',
      icon: map["weather"][0]['icon'] ?? '',
      temp: map["main"]['temp'] ?? 0.0,
      pressure: map["main"]['pressure'] ?? 0,
      humidity: map["main"]['humidity'] ?? 0,
      wind: map['wind']["speed"]?.toDouble() ?? 0.0,
      city: map['city']?.toDouble() ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(main: $main, description: $description, icon: $icon, temp: $temp, pressure: $pressure, humidity: $humidity, wind: $wind,city: $city)';
  }
}
