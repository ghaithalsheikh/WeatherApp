import 'package:easy_localization/easy_localization.dart' as ui;
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/viewmodels/weather_view_model.dart';
import 'package:weather/views/air_quality_view.dart';
import 'package:weather/views/foecast_day_view.dart';
import 'package:weather/widgets/animated_nav_right_left.dart';
import 'package:weather/widgets/column_forcast_hour_widget.dart';
import 'package:weather/widgets/first_container.dart';
import 'package:weather/widgets/row_forcastday.dart';

class DisplayWeather extends StatelessWidget {
  const DisplayWeather({
    super.key,
  });
  // final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel? weather = Provider.of<WeatherViewModel>(context).weather;
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    final screenWidth = screensize.width;
    final fontsize = screenHeight;
    String getDirectionName(String direction) {
      Map<String, String> directionMap = {
        'N': 'North',
        'NNE': 'North by Northeast',
        'NE': 'Northeast',
        'ENE': 'East by Northeast',
        'E': 'East',
        'ESE': 'East by Southeast',
        'SE': 'Southeast',
        'SSE': 'South by Southeast',
        'S': 'South',
        'SSW': 'South by Southwest',
        'SW': 'Southwest',
        'WSW': 'West by Southwest',
        'W': 'West',
        'WNW': 'West by Northwest',
        'NW': 'Northwest',
        'NNW': 'North by Northwest',
      };

      return directionMap[direction] ?? '';
    }

    String windDirection = weather!.windDir;
    String windDirectionName = getDirectionName(windDirection);

    String getAirquailty(int airquailty) {
      Map<int, String> airquailtyMap = {
        1: 'Good',
        2: 'Moderate',
        3: 'Unhealthy for sensitive group',
        4: 'Unhealthy',
        5: 'Very Unhealthy',
        6: 'Hazardous',
      };

      return airquailtyMap[airquailty] ?? '';
    }

    int airqua = weather.airQuality;
    // that variable used to display airquailtiy
    String airquality = getAirquailty(airqua);

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // the first container

            Firstcontainer(
              temp: weather.tempCurrent,
              maxTemp: weather.maxTempFirstDay,
              minTemp: weather.minTempFirstDay,
              weatherStateName: weather.weatherStateNameCurrent,
              color: Theme.of(context).primaryColor,
              height: 0.5,
              mainAxisAlignment: MainAxisAlignment.center,
              fontsizeTemp: 0.08,
              fontsizedegree: 0.05,
              fontsizeC: 0.05,
              offsetDegree: -0.02,
              offsetC: -0.03,
              elevatedButton: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.002),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: Theme.of(context)
                        .elevatedButtonTheme
                        .style
                        ?.backgroundColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      RightToLeftPageRoute(
                        builder: (context) => const AirQualtiyView(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FontAwesomeIcons.leaf,
                        color: Theme.of(context).iconTheme.color,
                        size: screenHeight * 0.03,
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Flexible(
                        child: Text(
                          ui.tr("Air Quality : ") + ui.tr(airquality),
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).splashColor,
                              fontSize: fontsize * 0.02),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //  that second container

            Container(
              padding: EdgeInsets.all(screenWidth * 0.03),
              // height: screenHeight * 0.40,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.blueGrey[400],
                        size: fontsize * 0.019,
                      ),
                      Text(
                        ui.tr('Forcast 3 Days'),
                        style: TextStyle(
                            color: Colors.blueGrey[400],
                            fontSize: fontsize * 0.019),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  RowForcastDay(
                    icon: weather.iconFirstDay,
                    maxTemp: weather.maxTempFirstDay,
                    minTemp: weather.minTempFirstDay,
                    weatherStateName: weather.weatherStateNameFirst,
                    dayName: 'Today',
                  ),
                  RowForcastDay(
                      maxTemp: weather.maxTempSecondDay,
                      minTemp: weather.minTempSecondDay,
                      weatherStateName: weather.weatherStateNameSecond,
                      icon: weather.iconSecondDay,
                      dayName: 'Tommorow'),
                  RowForcastDay(
                      maxTemp: weather.maxTempThirdDay,
                      minTemp: weather.minTempThirdDay,
                      weatherStateName: weather.weatherStateNameThird,
                      icon: weather.iconThirdDay,
                      dayName:
                          (ui.DateFormat('EEEE').format(weather.dateThird))),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.05,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: Theme.of(context)
                              .elevatedButtonTheme
                              .style
                              ?.backgroundColor,
                          foregroundColor: const WidgetStatePropertyAll<Color>(
                              Colors.white)),
                      onPressed: () {
                        Navigator.of(context).push(
                          RightToLeftPageRoute(
                            builder: (context) => const ForcastDayView(),
                          ),
                        );
                      },
                      child: Text(ui.tr('forcast-3days'),
                          style: TextStyle(
                              fontSize: fontsize * 0.022,
                              color: Theme.of(context).splashColor)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.26,
              margin: EdgeInsets.only(top: screenHeight * 0.01),
              padding: EdgeInsets.only(
                  top: screenHeight * 0.01,
                  left: screenWidth * 0.03,
                  right: screenWidth * 0.03),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.hourglass_bottom_outlined,
                        color: Colors.blueGrey[400],
                        size: fontsize * 0.03,
                      ),
                      Text(
                        ui.tr('Forcast 24 Hours'),
                        style: TextStyle(
                          color: Colors.blueGrey[400],
                          fontSize: fontsize * 0.022,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Expanded(
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourOne,
                          iconHour: weather.iconHourOne,
                          windHour: weather.windHourOne,
                          timeHour: weather.timeHourOne),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourTwo,
                          iconHour: weather.iconHourTwo,
                          windHour: weather.windHourTwo,
                          timeHour: weather.timeHourTwo),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourThree,
                          iconHour: weather.iconHourThree,
                          windHour: weather.windHourThree,
                          timeHour: weather.timeHourThree),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourFour,
                          iconHour: weather.iconHourFour,
                          windHour: weather.windHourFour,
                          timeHour: weather.timeHourFour),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourFive,
                          iconHour: weather.iconHourFive,
                          windHour: weather.windHourFive,
                          timeHour: weather.timeHourFive),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourSix,
                          iconHour: weather.iconHourSix,
                          windHour: weather.windHourSix,
                          timeHour: weather.timeHourSix),
                      ColumnForcastHourWidget(
                        tempHour: weather.tempHourSeven,
                        iconHour: weather.iconHourSeven,
                        windHour: weather.windHourSeven,
                        timeHour: weather.timeHourSeven,
                      ),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourEight,
                          iconHour: weather.iconHourEight,
                          windHour: weather.windHourEight,
                          timeHour: weather.timeHourEight),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourNine,
                          iconHour: weather.iconHourNine,
                          windHour: weather.windHourNine,
                          timeHour: weather.timeHourNine),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourTen,
                          iconHour: weather.iconHourTen,
                          windHour: weather.windHourTen,
                          timeHour: weather.timeHourTen),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourEleven,
                          iconHour: weather.iconHourEleven,
                          windHour: weather.windHourEleven,
                          timeHour: weather.timeHourEleven),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourTweleve,
                          iconHour: weather.iconHourTweleve,
                          windHour: weather.windHourTweleve,
                          timeHour: weather.timeHourTweleve),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourThirteen,
                          iconHour: weather.iconHourThirteen,
                          windHour: weather.windHourThirteen,
                          timeHour: weather.timeHourThirteen),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourFourteen,
                          iconHour: weather.iconHourFourteen,
                          windHour: weather.windHourFourteen,
                          timeHour: weather.timeHourFourteen),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourFifteen,
                          iconHour: weather.iconHourFifteen,
                          windHour: weather.windHourFifteen,
                          timeHour: weather.timeHourFifteen),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourSixteen,
                          iconHour: weather.iconHourSixteen,
                          windHour: weather.windHourSixteen,
                          timeHour: weather.timeHourSixteen),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourSeventeen,
                          iconHour: weather.iconHourSeventeen,
                          windHour: weather.windHourSeventeen,
                          timeHour: weather.timeHourSeventeen),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourEighteen,
                          iconHour: weather.iconHourEighteen,
                          windHour: weather.windHourEighteen,
                          timeHour: weather.timeHourEighteen),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourNineteen,
                          iconHour: weather.iconHourNineteen,
                          windHour: weather.windHourNineteen,
                          timeHour: weather.timeHourNineteen),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourTwenty,
                          iconHour: weather.iconHourTwenty,
                          windHour: weather.windHourTwenty,
                          timeHour: weather.timeHourTwenty),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourTwentyone,
                          iconHour: weather.iconHourTwentyone,
                          windHour: weather.windHourTwentyone,
                          timeHour: weather.timeHourTwentyone),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourTwentytwo,
                          iconHour: weather.iconHourTwentytwo,
                          windHour: weather.windHourTwentytwo,
                          timeHour: weather.timeHourTwentytwo),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourTwentythree,
                          iconHour: weather.iconHourTwentythree,
                          windHour: weather.windHourTwentythree,
                          timeHour: weather.timeHourTwentythree),
                      ColumnForcastHourWidget(
                          tempHour: weather.tempHourTwentyfour,
                          iconHour: weather.iconHourTwentyfour,
                          windHour: weather.windHourTwentyfour,
                          timeHour: weather.timeHourTwentyfour),
                    ]),
                  ),
                ],
              ),
            ),

            //  That is row contain two container
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.01,
                bottom: screenHeight * 0.01,
              ),
              child: Row(
                textDirection: TextDirection.ltr,
                children: [
                  // the first containerRow
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius:
                            BorderRadius.circular(screenWidth * 0.05)),
                    height: screenHeight * 0.30,
                    width: screenWidth * 0.5,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ui.tr('humidity'),
                                style: TextStyle(
                                  color: Theme.of(context).splashColor,
                                  fontSize: fontsize * 0.018,
                                ),
                              ),
                              Text(
                                '${weather.humidityCurrent}%',
                                style: TextStyle(
                                  color: Theme.of(context).splashColor,
                                  fontSize: fontsize * 0.018,
                                ),
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
                                ui.tr('feels like'),
                                style: TextStyle(
                                  color: Theme.of(context).splashColor,
                                  fontSize: fontsize * 0.018,
                                ),
                              ),
                              RichText(
                                  textDirection: TextDirection.ltr,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: (weather.feelslike)
                                            .toInt()
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: fontsize * 0.03,
                                            color:
                                                Theme.of(context).splashColor)),
                                    WidgetSpan(
                                        child: Transform.translate(
                                            offset: Offset(
                                                0, -0.003 * screenHeight),
                                            child: Text(
                                              '°',
                                              style: TextStyle(
                                                  fontSize: fontsize * 0.025,
                                                  color: Theme.of(context)
                                                      .splashColor),
                                            ))),
                                  ])),
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
                                ui.tr('pressure'),
                                style: TextStyle(
                                  color: Theme.of(context).splashColor,
                                  fontSize: fontsize * 0.018,
                                ),
                              ),
                              RichText(
                                textDirection: TextDirection.ltr,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      style: TextStyle(
                                          fontSize: fontsize * 0.018,
                                          color: Theme.of(context).splashColor),
                                      text:
                                          (weather.pressure).toInt().toString(),
                                    ),
                                    WidgetSpan(
                                        child: Transform.translate(
                                      offset: Offset(0, screenHeight * 0.006),
                                      child: Text(
                                        'mbar',
                                        style: TextStyle(
                                          color: Theme.of(context).splashColor,
                                          fontSize: fontsize * 0.020,
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
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
                                  fontSize: fontsize * 0.018,
                                ),
                              ),
                              Text(
                                '${weather.chanceRainFirst}%',
                                style: TextStyle(
                                  color: Theme.of(context).splashColor,
                                  fontSize: fontsize * 0.018,
                                ),
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
                                ui.tr('cloud'),
                                style: TextStyle(
                                  color: Theme.of(context).splashColor,
                                  fontSize: fontsize * 0.018,
                                ),
                              ),
                              Text(
                                '${weather.cloudCurrent}%',
                                style: TextStyle(
                                  color: Theme.of(context).splashColor,
                                  fontSize: fontsize * 0.018,
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            color: Theme.of(context).dividerColor,
                            thickness: 0.003 * screenWidth,
                            endIndent: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // the second container
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.02),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.020),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.05),
                          ),
                          height: screenHeight * 0.145,
                          width: screenWidth * 0.43,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // textDirection: TextDirection.ltr,
                                children: [
                                  Text(
                                    ui.tr('Sunrise'),
                                    style: TextStyle(
                                      color: Theme.of(context).splashColor,
                                      fontSize: fontsize * 0.015,
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.02,
                                  ),
                                  Text(weather.sunriseFirst,
                                      style: TextStyle(
                                        color: Theme.of(context).splashColor,
                                        fontSize: fontsize * 0.015,
                                      )),
                                  SizedBox(
                                    width: screenWidth * 0.02,
                                  ),
                                  Icon(
                                    Icons.wb_sunny_outlined,
                                    color: Theme.of(context).iconTheme.color,
                                    size: fontsize * 0.030,
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // textDirection: TextDirection.ltr,
                                children: [
                                  Text(ui.tr('Sunset'),
                                      style: TextStyle(
                                        color: Theme.of(context).splashColor,
                                        fontSize: fontsize * 0.015,
                                      )),
                                  SizedBox(
                                    width: screenWidth * 0.02,
                                  ),
                                  Text(weather.sunsetFirst,
                                      style: TextStyle(
                                        color: Theme.of(context).splashColor,
                                        fontSize: fontsize * 0.015,
                                      )),
                                  SizedBox(
                                    width: screenWidth * 0.02,
                                  ),
                                  Icon(
                                    Icons.sunny_snowing,
                                    color: Theme.of(context).iconTheme.color,
                                    size: fontsize * 0.030,
                                  ),
                                ],
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // textDirection: TextDirection.ltr,
                                children: [
                                  Text(ui.tr('Moonrise'),
                                      style: TextStyle(
                                        color: Theme.of(context).splashColor,
                                        fontSize: fontsize * 0.014,
                                      )),
                                  SizedBox(
                                    width: screenWidth * 0.02,
                                  ),
                                  Text(
                                      weather.moonriseFirst == 'No moonrise'
                                          ? ui.tr(weather.moonriseFirst)
                                          : weather.moonriseFirst,
                                      style: TextStyle(
                                        color: Theme.of(context).splashColor,
                                        fontSize: fontsize * 0.014,
                                      )),
                                  SizedBox(
                                    width: screenWidth * 0.02,
                                  ),
                                  Icon(
                                    Icons.mode_night_outlined,
                                    size: fontsize * 0.028,
                                    color: Theme.of(context).iconTheme.color,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                              top: screenHeight * 0.010,
                              // right: screenWidth * 0.015,
                            ),
                            padding: EdgeInsets.all(screenWidth * 0.020),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                            ),
                            height: screenHeight * 0.145,
                            width: screenWidth * 0.43,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  textDirection: TextDirection.ltr,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: screenWidth * 0.01),
                                    Icon(
                                      FontAwesomeIcons.compass,
                                      size: fontsize * 0.040,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    SizedBox(width: screenWidth * 0.02),
                                    Flexible(
                                      child: Text(
                                        ui.tr(windDirectionName),
                                        maxLines: 2,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Theme.of(context).splashColor,
                                          fontSize: fontsize * 0.016,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                Row(
                                  textDirection: TextDirection.ltr,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Spacer(flex: 1),
                                    Icon(
                                      FontAwesomeIcons.wind,
                                      size: fontsize * 0.040,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                    const Spacer(flex: 3),
                                    Text(
                                      '${weather.windspeedCurrent}Km/Ph',
                                      style: TextStyle(
                                        color: Theme.of(context).splashColor,
                                        fontSize: fontsize * 0.020,
                                      ),
                                    ),
                                    const Spacer(flex: 3),
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, screenHeight * 0.06)),
                backgroundColor: Theme.of(context)
                    .elevatedButtonTheme
                    .style
                    ?.backgroundColor,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  RightToLeftPageRoute(
                    builder: (context) => const AirQualtiyView(),
                  ),
                );
              },
              child: Row(
                children: [
                  const Spacer(flex: 1),
                  Icon(
                    FontAwesomeIcons.leaf,
                    color: Theme.of(context).iconTheme.color,
                    size: screenHeight * 0.035,
                  ),
                  SizedBox(width: screenWidth * 0.020),
                  Text(
                    ui.tr("Air Quality : ") + ui.tr(airquality),
                    style: TextStyle(
                      color: Theme.of(context).splashColor,
                      fontSize: fontsize * 0.021,
                    ),
                  ),
                  const Spacer(flex: 5),
                  Text(
                    ui.tr('More Details'),
                    style: TextStyle(
                      color: Theme.of(context).splashColor,
                      fontSize: fontsize * 0.021,
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
