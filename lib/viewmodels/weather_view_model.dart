import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/models/weather_model.dart';

import 'package:weather/services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  WeatherModel? weather;

  Future<WeatherModel> fetchWeather(
      {required Position? currentPosition, String lang = 'ar'}) async {
    WeatherModel? weatherData;
    try {
      if (currentPosition != null) {
        weatherData = await WeatherServices().getweather(
            location:
                '${currentPosition.latitude},${currentPosition.longitude}',
            lang: lang);

        notifyListeners();
      } else {
        throw Exception('Current position is null.');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error fetching weather: $e');
      // Handle error state or display error message
    }
    return weatherData!;
  }
}
