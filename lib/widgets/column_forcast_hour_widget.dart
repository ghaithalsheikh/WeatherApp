import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';

class ColumnForcastHourWidget extends StatelessWidget {
  const ColumnForcastHourWidget({
    super.key,
    required this.tempHour,
    required this.iconHour,
    required this.windHour,
    required this.timeHour,
  });

  final double tempHour;
  final String iconHour;
  final double windHour;
  final DateTime timeHour;

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    final screenWidth = screensize.width;

    final fontsize = screenHeight;
    return Padding(
      padding: EdgeInsets.only(right: screenWidth * 0.040),
      child: Column(
        children: [
          RichText(
              textDirection: TextDirection.ltr,
              text: TextSpan(children: [
                TextSpan(
                  text: ((tempHour)).toInt().toString(),
                  style: TextStyle(
                      fontSize: fontsize * 0.025,
                      color: Theme.of(context).splashColor),
                ),
                WidgetSpan(
                    child: Transform.translate(
                        offset: Offset(0, -0.001 * screenHeight),
                        child: Text(
                          '°',
                          style: TextStyle(
                              fontSize: fontsize * 0.025,
                              color: Theme.of(context).splashColor),
                        ))),
              ])),
          Image.network('https:$iconHour'),
          Text(
            '${windHour}Km/ph',
            style: TextStyle(
              color: Theme.of(context).splashColor,
              fontSize: fontsize * 0.017,
            ),
          ),
          Text(
            easy.DateFormat.Hm().format(timeHour),
            style: TextStyle(
              color: Theme.of(context).splashColor,
              fontSize: fontsize * 0.018,
            ),
          ),
        ],
      ),
    );
  }
}
