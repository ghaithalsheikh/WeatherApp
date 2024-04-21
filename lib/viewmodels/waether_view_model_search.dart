import 'package:flutter/material.dart';
import 'package:weather/models/weather_model_search.dart';
import 'package:weather/services/weather_sercive_search.dart';

class WeatherViewModelSearch extends ChangeNotifier {
  WeatherModelSearch? weatherData;

  Future<WeatherModelSearch?> fetchWeatherSearch({required cityName}) async {
    weatherData = await WeatherServicesSearch().getweather(
      cityName: cityName,
    );
    notifyListeners();
    return weatherData;
  }
}
