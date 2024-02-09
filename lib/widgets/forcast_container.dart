import 'package:easy_localization/easy_localization.dart' as ui;
import 'package:flutter/material.dart';
import 'package:weather/widgets/first_container.dart';

class ForcastContainer extends StatelessWidget {
  const ForcastContainer({
    super.key,
    required this.icon,
    required this.tempAvg,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.humiditiy,
    required this.chanceRain,
    required this.windSpeed,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.dayName,
  });

  final String icon;
  final double tempAvg;
  final double maxTemp;
  final double minTemp;
  final String weatherStateName;
  final int humiditiy;
  final int chanceRain;
  final double windSpeed;
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String dayName;

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    final screenWidth = screensize.width;
    final fontsize = screenHeight;
    return Container(
      height: screenHeight * 0.7,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(screenWidth * 0.05)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(
                flex: 5,
              ),
              Text(
                ui.tr(dayName),
                style: TextStyle(
                    color: Theme.of(context).splashColor,
                    fontSize: fontsize * 0.034),
              ),
              const Spacer(
                flex: 2,
              ),
              Image.network(
                'https:$icon',
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
          Firstcontainer(
              temp: tempAvg,
              maxTemp: maxTemp,
              minTemp: minTemp,
              weatherStateName: weatherStateName,
              height: 0.3,
              color: Theme.of(context).cardColor,
              mainAxisAlignment: MainAxisAlignment.center,
              fontsizeTemp: 0.10,
              fontsizedegree: 0.04,
              fontsizeC: 0.035,
              offsetDegree: -0.05,
              offsetC: -0.065),
          Container(
            padding: EdgeInsets.all(screenHeight * 0.01),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ui.tr('humidity'),
                      style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: fontsize * 0.022),
                    ),
                    Text(
                      '$humiditiy%',
                      style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: fontsize * 0.022),
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).dividerColor,
                  thickness: 0.003 * screenWidth,
                  endIndent: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ui.tr('chance of rain'),
                      style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: fontsize * 0.022),
                    ),
                    Text(
                      '$chanceRain%',
                      style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: fontsize * 0.022),
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).dividerColor,
                  thickness: 0.003 * screenWidth,
                  endIndent: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ui.tr('wind speed'),
                      style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: fontsize * 0.022),
                    ),
                    Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        Text(
                          " $windSpeed",
                          style: TextStyle(
                              color: Theme.of(context).splashColor,
                              fontSize: fontsize * 0.022),
                        ),
                        Text('Km/ph',
                            style: TextStyle(
                                color: Theme.of(context).splashColor,
                                fontSize: fontsize * 0.022))
                      ],
                    )
                  ],
                ),
                Divider(
                  color: Theme.of(context).dividerColor,
                  thickness: 0.003 * screenWidth,
                  endIndent: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ui.tr('Sunrise'),
                      style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: fontsize * 0.022),
                    ),
                    Text(
                      sunrise,
                      style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: fontsize * 0.022),
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).dividerColor,
                  thickness: 0.003 * screenWidth,
                  endIndent: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ui.tr('Sunset'),
                      style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: fontsize * 0.022),
                    ),
                    Text(
                      sunset,
                      style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: fontsize * 0.022),
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).dividerColor,
                  thickness: 0.003 * screenWidth,
                  endIndent: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ui.tr('Moonrise'),
                      style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: fontsize * 0.022),
                    ),
                    Text(
                      moonrise,
                      style: TextStyle(
                          color: Theme.of(context).splashColor,
                          fontSize: fontsize * 0.022),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
