import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model_search.dart';
import 'package:weather/viewmodels/waether_view_model_search.dart';
import 'package:weather/views/forcast_day_view_search.dart';
import 'package:weather/views/results_empty_view.dart';
import 'package:weather/widgets/message_no_internet.dart';

// ignore: must_be_immutable
class DisplayFuturSearcheWeather extends StatefulWidget {
  const DisplayFuturSearcheWeather({
    super.key,
    required this.cityName,
  });
  final String cityName;

  @override
  State<DisplayFuturSearcheWeather> createState() =>
      _DisplayFuturSearcheWeatherState();
}

class _DisplayFuturSearcheWeatherState
    extends State<DisplayFuturSearcheWeather> {
  dynamic future; // Make future nullable
  WeatherModelSearch? weatherData;

  @override
  void initState() {
    super.initState();
    final weatherViewModelSearch =
        Provider.of<WeatherViewModelSearch>(context, listen: false);
    future =
        weatherViewModelSearch.fetchWeatherSearch(cityName: widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    final weatherViewModelSearch = Provider.of<WeatherViewModelSearch>(context);
    return FutureBuilder<WeatherModelSearch>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            weatherViewModelSearch.weather = snapshot.data;
            return const ForcastDayViewSearch();
          } else if (snapshot.hasError) {
            return ResultsEmptyView(
              cityName: widget.cityName,
            );
            // ignore: unrelated_type_equality_checks
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
                color: Theme.of(context).primaryColor,
                child: const Center(child: CircularProgressIndicator()));
          } else if (snapshot.data == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              const MessagesErrore().showSnackBar(context);
            });
            Navigator.pop(context);
            return Container();
          } else {
            return Container();
          }
        });
  }
}
