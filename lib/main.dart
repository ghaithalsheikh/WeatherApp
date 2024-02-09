import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/provider_name_language.dart';
import 'package:weather/provider/provider_theme.dart';
import 'package:weather/viewmodels/waether_view_model_search.dart';
import 'package:weather/viewmodels/weather_view_model.dart';
import 'package:weather/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('ar', 'SA'), // Arabic
      Locale('en', 'US'), // Arabic
    ],
    path: 'assets/translations', // Path to translations directory
    fallbackLocale: const Locale('ar', 'SA'),
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherViewModel>(
          create: (context) => WeatherViewModel(),
        ),
        ChangeNotifierProvider<WeatherViewModelSearch>(
          create: (context) => WeatherViewModelSearch(),
        ),
        ChangeNotifierProvider<ProviderNameLanguage>(
          create: (context) => ProviderNameLanguage(),
        ),
        ChangeNotifierProvider<ProviderTheme>(
          create: (context) => ProviderTheme(),
        ),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        'HomeView': (context) => const HomeView(),
        // Other routes...
      },
      theme: Provider.of<ProviderTheme>(context, listen: true).toggle
          ? Provider.of<ProviderTheme>(context).dark
          : Provider.of<ProviderTheme>(context).light,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
