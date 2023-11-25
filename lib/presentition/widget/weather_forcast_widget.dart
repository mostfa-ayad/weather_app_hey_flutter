import 'package:flutter/widgets.dart';
import 'package:weather_app_hey_flutter/core/colors.dart';
import 'package:weather_app_hey_flutter/core/extintions.dart';
import 'package:weather_app_hey_flutter/presentition/widget/app_custom_text.dart';

class WeatherForcastWidget extends StatelessWidget {
  String date;
  String image;
  String value;
  String wind;
  WeatherForcastWidget({
    Key? key,
    required this.date,
    required this.image,
    required this.value,
    required this.wind,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppCustomText(
          text: date,
          size: 15,
          color: AppWhiteColor,
        ),
        SizedBox(height: context.height * .1, child: Image.network(image)),
        AppCustomText(
          text: value,
          size: 15,
          color: AppWhiteColor,
        ),
        AppCustomText(
          text: wind,
          size: 15,
          color: AppWhiteColor,
        ),
        AppCustomText(
          text: "km/h",
          size: 15,
          color: AppWhiteColor,
        )
      ],
    );
  }
}
