import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_hey_flutter/core/colors.dart';
import 'package:weather_app_hey_flutter/presentition/bloc/weather_bloc.dart';
import 'package:weather_app_hey_flutter/presentition/widget/app_custom_text.dart';
import 'package:weather_app_hey_flutter/presentition/widget/weather_card_widget.dart';

class LocationsListScreen extends StatelessWidget {
  const LocationsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 101, 39, 176), Colors.blueGrey],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: AppCustomText(
            text: "Saved Locations",
            size: 25,
            color: AppWhiteColor,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: AppWhiteColor,
            )
          ],
        ),
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            print(state.toString());
            if (state is WeatherLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherLoadListState) {
              print("---------------");
              print(state.list);
              return ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return const WeatherCardWidget();
                },
              );
            } else if (state is WeatherErrorState) {
              return Center(
                child: Text(state.msg),
              );
            } else {
              return const Center(
                child: Text("Error"),
              );
            }
          },
        ),
        bottomNavigationBar:
            ElevatedButton(onPressed: () {}, child: const Text("Add New")),
      ),
    );
  }
}
