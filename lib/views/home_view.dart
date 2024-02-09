import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/provider_name_language.dart';
import 'package:weather/viewmodels/weather_view_model.dart';
import 'package:weather/services/weather_service.dart';
import 'package:weather/views/search_bar_view.dart';
import 'package:weather/views/setting_view.dart';
import 'package:weather/widgets/animated_nav_right_left.dart';
import 'package:weather/widgets/dispaly_future_weather.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Position? currentPosition;
  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled
      return;
    }

    // Check if the app has permission to access location
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      // Location permissions are permanently denied
      return;
    }

    if (permission == LocationPermission.denied) {
      // Location permissions are denied, ask for permission
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        // Location permissions are denied (but not permanently)
        return;
      }
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPosition = position;
    });
  }

  dynamic future;
  Future<void> _refreshData() async {
    // Perform the refresh operation here
    // You can fetch new data or update existing data

    // Delay the completion of the refresh indicator for demonstration purposes
    await Future.delayed(const Duration(seconds: 2));

    final languageName =
        // ignore: use_build_context_synchronously
        Provider.of<ProviderNameLanguage>(context, listen: false).nameLanguage;
    setState(() {
      future = WeatherServices().getweather(
          location:
              '${currentPosition!.latitude},${currentPosition!.longitude}',
          lang: languageName);
    });
  }

  late String currentLanguage = 'ar';
  @override
  void didUpdateWidget(HomeView oldWidget) {
    super.didUpdateWidget(oldWidget);

    final languageName =
        Provider.of<ProviderNameLanguage>(context).nameLanguage;

    if (currentLanguage != languageName) {
      final weatherViewModel =
          Provider.of<WeatherViewModel>(context, listen: false);
      future = weatherViewModel.fetchWeather(
        currentPosition: currentPosition,
        lang: languageName,
      );
      currentLanguage = languageName;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;

    final fontsize = screenHeight;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Row(
          textDirection: TextDirection.ltr,
          children: [
            IconButton(
                color: Theme.of(context).splashColor,
                icon: Icon(
                  Icons.settings,
                  size: screenHeight * 0.035,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    RightToLeftPageRoute(
                      builder: (context) => const SettingView(),
                    ),
                  );
                }),
            const Spacer(
              flex: 4,
            ),
            Text(
              Provider.of<WeatherViewModel>(context).weather?.regionNAme ?? '',
              style: TextStyle(
                  color: Theme.of(context).splashColor,
                  fontSize: fontsize * 0.032),
            ),
            const Spacer(
              flex: 4,
            ),
            IconButton(
                iconSize: screenHeight * 0.035,
                color: Theme.of(context).splashColor,
                icon: const Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(
                    RightToLeftPageRoute(
                      builder: (context) => const SearchBarView(),
                    ),
                  );
                }),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: RefreshIndicator(
        displacement: screenHeight * 0.01,
        onRefresh: _refreshData,
        child: Center(
          child: currentPosition == null
              ? const CircularProgressIndicator()
              : DisplayFutureWeather(
                  future: future,
                  currentPosition: currentPosition!,
                ),
        ),
      ),
    );
  }
}
