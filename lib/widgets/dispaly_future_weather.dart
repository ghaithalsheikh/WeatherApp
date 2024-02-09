import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/provider/provider_name_language.dart';
import 'package:weather/viewmodels/weather_view_model.dart';
import 'package:weather/widgets/display_wheather.dart';
import 'package:weather/widgets/message_no_internet.dart';

// ignore: must_be_immutable
class DisplayFutureWeather extends StatefulWidget {
  DisplayFutureWeather({
    super.key,
    this.future,
    this.currentPosition,
  });
  dynamic future;
  Position? currentPosition;

  @override
  State<DisplayFutureWeather> createState() => _DisplayFutureWeatherState();
}

class _DisplayFutureWeatherState extends State<DisplayFutureWeather> {
  dynamic future;

  late String currentLanguage = 'ar';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final languageName =
        Provider.of<ProviderNameLanguage>(context).nameLanguage;

    if (currentLanguage != languageName || future == null) {
      final weatherViewModel = Provider.of<WeatherViewModel>(context);
      future = weatherViewModel.fetchWeather(
        currentPosition: widget.currentPosition,
        lang: languageName,
      );
      currentLanguage = languageName;
    }
  }

  @override
  void didUpdateWidget(DisplayFutureWeather oldWidget) {
    super.didUpdateWidget(oldWidget);

    final languageName =
        Provider.of<ProviderNameLanguage>(context).nameLanguage;

    if (currentLanguage != languageName) {
      final weatherViewModel =
          Provider.of<WeatherViewModel>(context, listen: false);
      future = weatherViewModel.fetchWeather(
        currentPosition: widget.currentPosition,
        lang: languageName,
      );
      currentLanguage = languageName;
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherViewModel = Provider.of<WeatherViewModel>(context);
    return FutureBuilder<WeatherModel>(
        future: widget.future ?? future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            weatherViewModel.weather = snapshot.data;
            return const DisplayWeather();
          } else if (snapshot.data == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              const MessagesErrore().showSnackBar(context);
            });
            return Container();
          } else if (snapshot.hasError) {
            // ignore: avoid_print
            print('${snapshot.error}');
            return Text('${snapshot.error}');
          } else {
            return Container();
          }
        });
  }
}
