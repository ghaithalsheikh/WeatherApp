import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as ui;
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model_search.dart';
import 'package:weather/viewmodels/waether_view_model_search.dart';
import 'package:weather/widgets/forcast_container.dart';

class ForcastDayViewSearch extends StatelessWidget {
  const ForcastDayViewSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    final screenWidth = screensize.width;
    WeatherModelSearch? weatherSearch =
        Provider.of<WeatherViewModelSearch>(context).weatherData;
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
              color: Colors.white,
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
            const Spacer(flex: 2),
            Text(
              (weatherSearch?.locationName) ?? '',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenHeight * 0.026,
              ),
            ),
            const Spacer(flex: 2),
            IconButton(
                color: Colors.white,
                onPressed: () {
                  // Here We back direct to HomeView
                  int count = 0; // Number of routes to pop
                  Navigator.of(context).popUntil((route) {
                    return count++ ==
                        2; // Change the count to the desired number of routes to pop
                  });
                },
                icon: const Icon(Icons.home))
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(screenWidth * 0.02),
          children: [
            ForcastContainer(
              dayName: 'Today',
              icon: weatherSearch?.iconFirstDay ?? '',
              tempAvg: weatherSearch?.tempAvgDayFirst ?? 0,
              maxTemp: weatherSearch?.maxTempFirstDay ?? 0,
              minTemp: weatherSearch?.minTempFirstDay ?? 0,
              weatherStateName: weatherSearch?.weatherStateNameFirst ?? '',
              chanceRain: weatherSearch?.chanceRainFirst ?? 0,
              windSpeed: weatherSearch?.windspeedDayFirst ?? 0,
              humiditiy: weatherSearch?.avgHumidityFirst ?? 0,
              sunrise: weatherSearch?.sunriseFirst ?? "",
              sunset: weatherSearch?.sunsetFirst ?? "",
              moonrise: weatherSearch?.moonriseFirst ?? '',
            ),
            SizedBox(height: screenHeight * 0.01),
            ForcastContainer(
              dayName: 'Tommorow',
              icon: weatherSearch?.iconSecondDay ?? '',
              tempAvg: weatherSearch?.tempAvgDaySecond ?? 0,
              maxTemp: weatherSearch?.maxTempSecondDay ?? 0,
              minTemp: weatherSearch?.minTempSecondDay ?? 0,
              weatherStateName: weatherSearch?.weatherStateNameSecond ?? '',
              chanceRain: weatherSearch?.chanceRainSecond ?? 0,
              windSpeed: weatherSearch?.windspeedDaySecond ?? 0,
              humiditiy: weatherSearch?.avgHumiditySecond ?? 0,
              sunrise: weatherSearch?.sunriseSecond ?? '',
              sunset: weatherSearch?.sunsetSecond ?? '',
              moonrise: weatherSearch?.moonriseSecond ?? '',
            ),
            SizedBox(height: screenHeight * 0.01),
            ForcastContainer(
              icon: weatherSearch?.iconThirdDay ?? '',
              tempAvg: weatherSearch?.tempAvgDayThird ?? 0,
              maxTemp: weatherSearch?.maxTempThirdDay ?? 0,
              minTemp: weatherSearch?.minTempThirdDay ?? 0,
              weatherStateName: weatherSearch?.weatherStateNameThird ?? '',
              humiditiy: weatherSearch?.avgHumidityThird ?? 0,
              chanceRain: weatherSearch?.chanceRainThird ?? 0,
              windSpeed: weatherSearch?.windspeedDayThird ?? 0,
              sunrise: weatherSearch?.sunriseThird ?? '',
              sunset: weatherSearch?.sunsetThird ?? '',
              moonrise: weatherSearch?.moonriseThird ?? '',
              dayName: (ui.DateFormat('EEEE')
                  .format(weatherSearch?.thirdDayName ?? DateTime.now())),
            ),
            SizedBox(height: screenHeight * 0.01),
          ],
        ),
      ),
    );
  }
}
