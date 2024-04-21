import 'package:easy_localization/easy_localization.dart' as ui;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/viewmodels/weather_view_model.dart';

class AirQualtiyView extends StatelessWidget {
  const AirQualtiyView({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel? weather = Provider.of<WeatherViewModel>(context).weatherData;
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

    int airqua = weather!.airQuality;
    // that variable used to display airquailtiy
    String airquality = getAirquailty(airqua);
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    final screenWidth = screensize.width;
    Locale currentLocale = context.locale;
    String currentlang = currentLocale.languageCode;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          ],
        ),
        elevation: 0,
        scrolledUnderElevation: 0, // Remove the shadow effect
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ui.tr('Air quality index'),
              style: TextStyle(
                  color: Colors.grey[400], fontSize: screenHeight * 0.040),
            ),
            Text(
              '${ui.tr('last update :')}${ui.DateFormat('yyyy-MM-dd HH:mm').format(weather.lastUpdate)}',
              style: TextStyle(
                  color: Colors.grey[400], fontSize: screenHeight * 0.022),
            ),
            Text(
              '${ui.tr('Air Quality: ')}${ui.tr(airquality)}',
              style: TextStyle(
                  color: Colors.green[900], fontSize: screenHeight * 0.024),
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '${weather.airQualityCO}',
                      style: TextStyle(
                          color: Colors.green[900],
                          fontSize: screenHeight * 0.020),
                    ),
                    Text(
                      'CO',
                      style: TextStyle(fontSize: screenHeight * 0.020),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${weather.airQualityO3}',
                      style: TextStyle(
                          color: Colors.green[900],
                          fontSize: screenHeight * 0.020),
                    ),
                    Text(
                      'O3',
                      style: TextStyle(fontSize: screenHeight * 0.020),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${weather.airQualityNO2}',
                      style: TextStyle(
                          color: Colors.green[900],
                          fontSize: screenHeight * 0.020),
                    ),
                    Text(
                      'NO2',
                      style: TextStyle(fontSize: screenHeight * 0.020),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${weather.airQualitySO2}',
                      style: TextStyle(
                          color: Colors.green[900],
                          fontSize: screenHeight * 0.020),
                    ),
                    Text(
                      'SO2',
                      style: TextStyle(fontSize: screenHeight * 0.020),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${weather.airQualityPM10}',
                      style: TextStyle(
                          color: Colors.green[900],
                          fontSize: screenHeight * 0.020),
                    ),
                    Text(
                      'PM10',
                      style: TextStyle(fontSize: screenHeight * 0.020),
                    ),
                    // Text('%'),
                    // Text('PM2.5'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '${weather.airQualityPM2_5}',
                      style: TextStyle(
                          color: Colors.green[900],
                          fontSize: screenHeight * 0.020),
                    ),
                    Text(
                      'PM2.5',
                      style: TextStyle(fontSize: screenHeight * 0.020),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
