import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_hey_flutter/core/colors.dart';
import 'package:weather_app_hey_flutter/core/extintions.dart';
import 'package:weather_app_hey_flutter/presentition/bloc/weather_bloc.dart';
import 'package:weather_app_hey_flutter/presentition/screen/locations_list_screen.dart';
import 'package:weather_app_hey_flutter/presentition/widget/app_custom_text.dart';
import 'package:weather_app_hey_flutter/presentition/widget/weather_data_type_widget.dart';
import 'package:weather_app_hey_flutter/presentition/widget/weather_forcast_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            "assets/images/newyork.jpg",
            fit: BoxFit.fitHeight,
          )),
          Positioned.fill(
              child: Opacity(
            opacity: 0.2,
            child: Image.asset(
              "assets/images/Lightning-Download-PNG.png",
              fit: BoxFit.fitHeight,
            ),
          )),
          const Opacity(
            opacity: .1,
            child: SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(flex: 1, child: build_header(context)),
              Expanded(flex: 5, child: build_body(context)),
              Expanded(flex: 3, child: build_weather_forcast()),
            ],
          )
        ],
      )),
    );
  }

  build_header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              Icon(
                Icons.location_on,
                color: AppWhiteColor,
              ),
              AppCustomText(
                text: "New Yourk",
                size: 20,
                color: AppWhiteColor,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          IconButton(
            onPressed: () {
              BlocProvider.of<WeatherBloc>(context).add(WeatherLoadList());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocationsListScreen(),
                  ));
            },
            icon: Icon(
              Icons.menu,
              color: AppWhiteColor,
            ),
          )
        ],
      ),
    );
  }

  build_body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AppCustomText(
          text: "June 6",
          size: context.height * .07,
          fontWeight: FontWeight.bold,
          color: AppWhiteColor,
        ),
        AppCustomText(
          text: "updated at 6/7/2023",
          size: 15,
          fontWeight: FontWeight.normal,
          color: AppWhiteColor,
        ),
        SizedBox(
          height: context.height * .2,
          child: Image.network(
            "https://openweathermap.org/img/wn/11n@2x.png",
            fit: BoxFit.cover,
          ),
        ),
        AppCustomText(
          text: "ThunderStorm",
          size: context.height * .07,
          fontWeight: FontWeight.bold,
          color: AppWhiteColor,
        ),
        Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppCustomText(
                text: "25",
                size: context.height * .07,
                fontWeight: FontWeight.bold,
                color: AppWhiteColor,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: AppCustomText(
                  text: "o",
                  size: 10,
                  fontWeight: FontWeight.bold,
                  color: AppWhiteColor,
                ),
              ),
              AppCustomText(
                text: "c",
                size: 25,
                fontWeight: FontWeight.bold,
                color: AppWhiteColor,
              )
            ],
          ),
        ),
        build_footer()
      ],
    );
  }

  build_footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        WeatherDataTypeWidget(
            icon: Icons.water_drop_outlined, title: "HUMIDITY", data: "34%"),
        WeatherDataTypeWidget(
            icon: Icons.air, title: "WIND", data: "9.26 km/h"),
        WeatherDataTypeWidget(
            icon: Icons.thermostat_sharp, title: "FELLS LIKE", data: "24"),
      ],
    );
  }

  build_weather_forcast() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          SizedBox.expand(
            child: Opacity(
              opacity: 0.2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherForcastWidget(
                  date: "16/7",
                  image: "https://openweathermap.org/img/wn/10d@2x.png",
                  value: "20",
                  wind: "10-5"),
              WeatherForcastWidget(
                  date: "16/7",
                  image: "https://openweathermap.org/img/wn/10d@2x.png",
                  value: "20",
                  wind: "10-5"),
              WeatherForcastWidget(
                  date: "16/7",
                  image: "https://openweathermap.org/img/wn/10d@2x.png",
                  value: "20",
                  wind: "10-5"),
              WeatherForcastWidget(
                  date: "16/7",
                  image: "https://openweathermap.org/img/wn/10d@2x.png",
                  value: "20",
                  wind: "10-5")
            ],
          )
        ],
      ),
    );
  }
}
