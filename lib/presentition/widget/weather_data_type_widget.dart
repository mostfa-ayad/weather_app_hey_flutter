import 'package:flutter/widgets.dart';
import 'package:weather_app_hey_flutter/core/colors.dart';
import 'package:weather_app_hey_flutter/presentition/widget/app_custom_text.dart';

class WeatherDataTypeWidget extends StatelessWidget {
  IconData icon;
  String title;
  String data;
  WeatherDataTypeWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppWhiteColor,
        ),
        AppCustomText(
          text: title,
          size: 15,
          color: AppWhiteColor,
        ),
        AppCustomText(
          text: data,
          size: 15,
          color: AppWhiteColor,
        )
      ],
    );
  }
}
