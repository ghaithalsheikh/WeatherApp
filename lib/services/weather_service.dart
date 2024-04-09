import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '46ec576b16fc4a16b46122834221212';
  Future<WeatherModel> getweather(
      {String location = '', String lang = 'ar', String cityName = ''}) async {
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&lang=$lang&q=$location&days=5&aqi=yes');
    http.Response response = await http.get(url);

    // we used the function jsonDecode for convert the data string to json data
    Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
