import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model_search.dart';

class WeatherServicesSearch {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '46ec576b16fc4a16b46122834221212';
  // تابع يقوم باخذ اسم المدينة وثم يقوم بطلب بيانات هذه المدينة
  Future<WeatherModelSearch> getweather(
      {String lang = 'ar', required String cityName}) async {
    // انشئنا غرض من كلاس (uri)
    // واستخدمنا بارس لتحويلها الى غرض يمكن التعامل معه
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&lang=$lang&days=5&aqi=yes');

    // قمنا باستخدام التابع جيت ليجلب المعلومات
    // ثم قمنا بانشاء غرض من ريسبونس  لاستقبال المعلومات التي ستأتينا

    http.Response response = await http.get(url);

    // we used the function jsonDecode for convert the data string to json data
    Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

    WeatherModelSearch weather = WeatherModelSearch.fromJson(data);

    return weather;
  }
}
