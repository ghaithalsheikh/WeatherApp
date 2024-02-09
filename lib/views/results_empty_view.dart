import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather/widgets/result_search_empty.dart';

class ResultsEmptyView extends StatelessWidget {
  const ResultsEmptyView({super.key, required this.cityName});
  final String cityName;
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    Locale currentLocale = context.locale;
    String currentlang = currentLocale.languageCode;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: ResultSearchEmpty(serachName: cityName),
    );
  }
}
