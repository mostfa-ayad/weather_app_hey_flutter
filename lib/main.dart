import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_hey_flutter/data/datasource/weather_datasource.dart';
import 'package:weather_app_hey_flutter/presentition/bloc/weather_bloc.dart';
import 'package:weather_app_hey_flutter/presentition/screen/homepage.dart';
import 'package:weather_app_hey_flutter/core/injection.dart' as injection;

void main() {
  injection.setup();
  runApp(const MyApp());
  WeatherOpenApiDatasource().getWeatherStatuesByCityName("london");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              injection.di<WeatherBloc>()..add(WeatherLoadList()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: const Homepage(),
      ),
    );
  }
}
