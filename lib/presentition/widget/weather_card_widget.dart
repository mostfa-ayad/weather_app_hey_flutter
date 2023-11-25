import 'package:flutter/material.dart';
import 'package:weather_app_hey_flutter/core/colors.dart';
import 'package:weather_app_hey_flutter/core/extintions.dart';
import 'package:weather_app_hey_flutter/presentition/widget/app_custom_text.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: context.height * .2,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Opacity(
                opacity: 0.2,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: AppWhiteColor,
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppCustomText(
                            text: "New Yourk",
                            size: 25,
                            color: AppWhiteColor,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                          ),
                          AppCustomText(
                            text: "sunny",
                            size: 15,
                            height: 1.5,
                            color: AppWhiteColor,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppCustomText(
                                text: "Humidity",
                                size: 12,
                                height: 1.5,
                                color: AppWhiteColor,
                              ),
                              AppCustomText(
                                text: "52%",
                                size: 12,
                                height: 1.5,
                                color: AppWhiteColor,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              AppCustomText(
                                text: "wind",
                                size: 12,
                                height: 1.5,
                                color: AppWhiteColor,
                              ),
                              AppCustomText(
                                text: "15 km/h",
                                size: 12,
                                height: 1.5,
                                color: AppWhiteColor,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: context.height * 0.1,
                        child: Image.network(
                            "https://openweathermap.org/img/wn/10d@2x.png"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: AppCustomText(
                              text: "33",
                              size: 35,
                              color: AppWhiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          AppCustomText(
                            text: "°C",
                            size: 20,
                            color: AppWhiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
