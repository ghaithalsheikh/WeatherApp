import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/widgets/animated_nav_right_left.dart';
import 'package:weather/widgets/display_future_search_weather.dart';

class SearchOfBar extends StatefulWidget {
  const SearchOfBar({
    super.key,
  });

  @override
  State<SearchOfBar> createState() => _SearchOfBarState();
}

class _SearchOfBarState extends State<SearchOfBar> {
  final TextEditingController _searchController = TextEditingController();
  bool isTextFieldActive = false;
  ui.TextDirection? _currentTextDirection;

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    final screenWidth = screensize.width;
    final fontsize = screenHeight;
    return SizedBox(
      height: screenHeight * 0.05,
      child: TextField(
        autofocus: true,
        textInputAction: TextInputAction.search,
        autocorrect: true,
        style:
            TextStyle(fontSize: fontsize * 0.02, height: screenHeight * 0.001),
        controller: _searchController,
        decoration: InputDecoration(
          labelText: tr('Search'),
          suffixIcon: isTextFieldActive &&
                      _currentTextDirection == ui.TextDirection.ltr ||
                  isTextFieldActive &&
                      _currentTextDirection == ui.TextDirection.rtl
              ? IconButton(
                  icon: Icon(
                    FontAwesomeIcons.xmark,
                    size: fontsize * 0.02,
                  ),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      isTextFieldActive = false;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(screenWidth * 0.05))),
        ),
        onSubmitted: (value) async {
          setState(() {
            _searchController.clear();
            isTextFieldActive = false;
          });
          if (value.isNotEmpty) {
            Navigator.of(context).push(
              RightToLeftPageRoute(
                builder: (context) => DisplayFuturSearcheWeather(
                  cityName: value,
                ),
              ),
            );
          } else if (value.isEmpty) {
            setState(() {
              isTextFieldActive = false;
            });
          }
        },
        onChanged: (value) {
          setState(() {
            isTextFieldActive = value.isNotEmpty;
          });
          if (value.isEmpty) {
            setState(() {
              isTextFieldActive = false;
            });
          }
          if (value.contains(RegExp(r'[a-zA-Z]'))) {
            // English language detected
            setState(() {
              _currentTextDirection = ui.TextDirection.ltr;
            });
          } else if (value.contains(RegExp(r'[\u0600-\u06FF]'))) {
            // Arabic language detected
            setState(() {
              _currentTextDirection = ui.TextDirection.rtl;
            });
          }
        },
        textDirection: _currentTextDirection,
      ),
    );
  }
}
