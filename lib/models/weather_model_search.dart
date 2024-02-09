class WeatherModelSearch {
  final DateTime thirdDayName;
  final String iconFirstDay;
  final String iconSecondDay;
  final String iconThirdDay;
  final double maxTempFirstDay;
  final double maxTempSecondDay;
  final double maxTempThirdDay;
  final double minTempFirstDay;
  final double minTempSecondDay;
  final double minTempThirdDay;
  final String weatherStateNameFirst;
  final String weatherStateNameSecond;
  final String weatherStateNameThird;
  final int chanceRainFirst;
  final int chanceRainSecond;
  final int chanceRainThird;
  final double windspeedDayFirst;
  final double windspeedDaySecond;
  final double windspeedDayThird;
  final int avgHumidityFirst;
  final int avgHumiditySecond;
  final int avgHumidityThird;
  final String sunriseFirst;
  final String sunriseSecond;
  final String sunriseThird;
  final String sunsetFirst;
  final String sunsetSecond;
  final String sunsetThird;
  final String moonriseFirst;
  final String moonriseSecond;
  final String moonriseThird;
  final double tempAvgDayFirst;
  final double tempAvgDaySecond;
  final double tempAvgDayThird;
  final String locationName;

  WeatherModelSearch({
    required this.maxTempFirstDay,
    required this.maxTempSecondDay,
    required this.maxTempThirdDay,
    required this.minTempFirstDay,
    required this.minTempSecondDay,
    required this.minTempThirdDay,
    required this.weatherStateNameFirst,
    required this.weatherStateNameSecond,
    required this.weatherStateNameThird,
    required this.chanceRainFirst,
    required this.chanceRainSecond,
    required this.chanceRainThird,
    required this.windspeedDayFirst,
    required this.windspeedDaySecond,
    required this.windspeedDayThird,
    required this.avgHumidityFirst,
    required this.avgHumiditySecond,
    required this.avgHumidityThird,
    required this.sunriseFirst,
    required this.sunriseSecond,
    required this.sunriseThird,
    required this.sunsetFirst,
    required this.sunsetSecond,
    required this.sunsetThird,
    required this.moonriseFirst,
    required this.moonriseThird,
    required this.moonriseSecond,
    required this.thirdDayName,
    required this.iconFirstDay,
    required this.iconSecondDay,
    required this.iconThirdDay,
    required this.tempAvgDayFirst,
    required this.tempAvgDaySecond,
    required this.tempAvgDayThird,
    required this.locationName,
  });

  factory WeatherModelSearch.fromJson(data) {
    var forecast = data['forecast'];
    var forecastday = forecast['forecastday'];

    var dayName = forecastday[2]['date'];
    var forecastDayFirst = forecastday[0]['day'];
    var forcastDaySecond = forecastday[1]['day'];
    var forcastDayThird = forecastday[2]['day'];
    var forecastAstroDayFirst = forecastday[0]['astro'];
    var forecastAstroDaySecond = forecastday[1]['astro'];
    var forecastAstroDayThird = forecastday[2]['astro'];

    return WeatherModelSearch(
      locationName: data['location']['name'],
      thirdDayName: DateTime.parse(dayName),
      maxTempFirstDay: forecastDayFirst['maxtemp_c'],
      minTempFirstDay: forecastDayFirst['mintemp_c'],
      maxTempSecondDay: forcastDaySecond['maxtemp_c'],
      minTempSecondDay: forcastDaySecond['mintemp_c'],
      maxTempThirdDay: forcastDayThird['maxtemp_c'],
      minTempThirdDay: forcastDayThird['mintemp_c'],
      weatherStateNameFirst: forecastDayFirst['condition']['text'],
      weatherStateNameSecond: forcastDaySecond['condition']['text'],
      weatherStateNameThird: forcastDayThird['condition']['text'],
      windspeedDayFirst: forecastDayFirst['maxwind_kph'],
      windspeedDaySecond: forcastDaySecond['maxwind_kph'],
      windspeedDayThird: forcastDayThird['maxwind_kph'],
      chanceRainFirst: forecastDayFirst['daily_chance_of_rain'],
      chanceRainSecond: forcastDaySecond['daily_chance_of_rain'],
      chanceRainThird: forcastDayThird['daily_chance_of_rain'],
      avgHumidityFirst: forecastDayFirst['avghumidity'],
      avgHumiditySecond: forcastDaySecond['avghumidity'],
      avgHumidityThird: forcastDayThird['avghumidity'],
      sunriseFirst: forecastAstroDayFirst['sunrise'],
      sunriseSecond: forecastAstroDaySecond['sunrise'],
      sunriseThird: forecastAstroDayThird['sunrise'],
      sunsetFirst: forecastAstroDayFirst['sunset'],
      sunsetSecond: forecastAstroDaySecond['sunset'],
      sunsetThird: forecastAstroDayThird['sunset'],
      moonriseFirst: forecastAstroDayFirst['moonrise'],
      moonriseSecond: forecastAstroDaySecond['moonrise'],
      moonriseThird: forecastAstroDayThird['moonrise'],
      iconFirstDay: forecastDayFirst['condition']['icon'],
      iconSecondDay: forcastDaySecond['condition']['icon'],
      iconThirdDay: forcastDayThird['condition']['icon'],
      tempAvgDayFirst: forecastDayFirst['avgtemp_c'],
      tempAvgDaySecond: forcastDaySecond['avgtemp_c'],
      tempAvgDayThird: forcastDayThird['avgtemp_c'],
    );
  }
}
