import 'package:easy_localization/easy_localization.dart' as ui;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/provider/provider_name_language.dart';
import 'package:weather/provider/provider_theme.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedOption;
    Paint background = Paint();
    background.color = Colors.blue;
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    final screenWidth = screensize.width;
    Locale currentLocale = context.locale;
    String currentlang = currentLocale.languageCode;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: currentlang == 'en'
                  ? Icon(Icons.keyboard_arrow_left,
                      size: screenHeight * 0.05,
                      color: Theme.of(context).splashColor)
                  : Icon(Icons.keyboard_arrow_right,
                      size: screenHeight * 0.05,
                      color: Theme.of(context).splashColor),
            ),
            Text(
              ui.tr('Setting'),
              style: TextStyle(
                  fontSize: screenHeight * 0.024,
                  color: Theme.of(context).splashColor),
            ),
            const Spacer(flex: 2),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Transform.scale(
                scale: screenWidth * 0.002,
                child: Switch(
                    value: Provider.of<ProviderTheme>(context, listen: false)
                        .toggle,
                    onChanged: (newValue) {
                      Provider.of<ProviderTheme>(context, listen: false)
                          .toggleTheme(newValue);
                    },
                    activeColor: Colors.indigo),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Text(
                ui.tr('Dark Mode'),
                style: TextStyle(
                    fontSize: screenHeight * 0.022,
                    color: Theme.of(context).splashColor),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Row(
              children: [
                Icon(Icons.language,
                    size: screenHeight * 0.045,
                    color: Theme.of(context).splashColor),
                SizedBox(
                  width: screenWidth * 0.04,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<Locale>(
                    dropdownColor: Theme.of(context).cardColor,
                    iconSize: 0,
                    value: context.locale,
                    items: [
                      DropdownMenuItem(
                        value: const Locale('ar', 'SA'),
                        child: Text('العربية',
                            style: TextStyle(
                              color: Theme.of(context).splashColor,
                            )),
                      ),
                      DropdownMenuItem(
                        value: const Locale('en', 'US'),
                        child: Text('English',
                            style: TextStyle(
                                color: Theme.of(context).splashColor)),
                      ),
                    ],
                    onChanged: (Locale? newLocale) {
                      String? lang;
                      if (newLocale.toString() == 'ar_SA') {
                        lang = 'ar';
                      } else if (newLocale.toString() == 'en_US') {
                        lang = 'en';
                      }
                      ui.EasyLocalization.of(context)!.setLocale(newLocale!);
                      Provider.of<ProviderNameLanguage>(context, listen: false)
                          .setNameLanguage(lang!);

                      if (newLocale.toString() == selectedOption) {
                        selectedOption =
                            null; // Cancel the selection if it's the same value
                      } else {
                        selectedOption =
                            newLocale.toString(); // Update the selected option
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
