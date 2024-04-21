import 'package:easy_localization/easy_localization.dart' as ui;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/viewmodels/weather_view_model.dart';
import 'package:weather/widgets/forcast_container.dart';

class ForcastDayView extends StatelessWidget {
  const ForcastDayView({super.key});
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    final screenWidth = screensize.width;
    WeatherModel? weather = Provider.of<WeatherViewModel>(context).weatherData;
    Locale currentLocale = context.locale;
    String currentlang = currentLocale.languageCode;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0, // Remove the shadow effect
        backgroundColor:
            Colors.transparent, // Set the background color of the app bar
        title: Row(
          children: [
            IconButton(
              icon: currentlang == 'en'
                  ? Icon(Icons.keyboard_arrow_left,
                      size: screenHeight * 0.05,
                      color: Theme.of(context).splashColor)
                  : Icon(Icons.keyboard_arrow_right,
                      size: screenHeight * 0.05,
                      color: Theme.of(context).splashColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              ui.tr('Forcast 3 Days'),
              style: TextStyle(
                  fontSize: screenHeight * 0.026,
                  color: Theme.of(context).splashColor),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          // shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(screenWidth * 0.02),
          children: [
            ForcastContainer(
              dayName: 'Today',
              icon: weather!.iconFirstDay,
              tempAvg: weather.tempAvgDayFirst,
              maxTemp: weather.maxTempFirstDay,
              minTemp: weather.minTempFirstDay,
              weatherStateName: weather.weatherStateNameFirst,
              chanceRain: weather.chanceRainFirst,
              windSpeed: weather.windspeedDayFirst,
              humiditiy: weather.avgHumidityFirst,
              sunrise: weather.sunriseFirst,
              sunset: weather.sunsetFirst,
              moonrise: weather.moonriseFirst,
            ),
            SizedBox(height: screenHeight * 0.01),
            ForcastContainer(
              dayName: 'Tommorow',
              icon: weather.iconSecondDay,
              tempAvg: weather.tempAvgDaySecond,
              maxTemp: weather.maxTempSecondDay,
              minTemp: weather.minTempSecondDay,
              weatherStateName: weather.weatherStateNameSecond,
              chanceRain: weather.chanceRainSecond,
              windSpeed: weather.windspeedDaySecond,
              humiditiy: weather.avgHumiditySecond,
              sunrise: weather.sunriseSecond,
              sunset: weather.sunsetSecond,
              moonrise: weather.moonriseSecond,
            ),
            SizedBox(height: screenHeight * 0.01),
            ForcastContainer(
              icon: weather.iconThirdDay,
              tempAvg: weather.tempAvgDayThird,
              maxTemp: weather.maxTempThirdDay,
              minTemp: weather.minTempThirdDay,
              weatherStateName: weather.weatherStateNameThird,
              humiditiy: weather.avgHumidityThird,
              chanceRain: weather.chanceRainThird,
              windSpeed: weather.windspeedDayThird,
              sunrise: weather.sunriseThird,
              sunset: weather.sunsetThird,
              moonrise: weather.moonriseThird,
              dayName: (ui.DateFormat('EEEE').format(weather.dateThird)),
            ),
            SizedBox(height: screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
}
