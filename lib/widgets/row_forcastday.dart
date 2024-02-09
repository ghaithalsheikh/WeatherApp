import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' as ui;
import 'package:flutter/material.dart';

class RowForcastDay extends StatelessWidget {
  const RowForcastDay({
    super.key,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.icon,
    required this.dayName,
  });

  final double maxTemp;
  final double minTemp;
  final String weatherStateName;
  final String? icon;
  final String dayName;

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    final screenWidth = screensize.width;
    final fontsize = screenHeight;
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: 'https:$icon',
          placeholder: (context, url) =>
              SizedBox(height: screenHeight * 0.06, width: screenWidth * 0.15),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        // Image.network('https:$icon'),
        const Spacer(
          flex: 1,
        ),
        Text(
          ui.tr(dayName),
          style: TextStyle(
              color: Theme.of(context).splashColor, fontSize: fontsize * 0.02),
        ),
        const Spacer(
          flex: 1,
        ),
        Text(
          weatherStateName,
          style: TextStyle(
              color: Theme.of(context).splashColor, fontSize: fontsize * 0.02),
        ),
        const Spacer(
          flex: 8,
        ),
        Row(
          textDirection: TextDirection.rtl,
          children: [
            RichText(
                textDirection: TextDirection.ltr,
                text: TextSpan(children: [
                  TextSpan(
                    text: (maxTemp).toInt().toString(),
                    style: TextStyle(
                        fontSize: fontsize * 0.03,
                        color: Theme.of(context).splashColor),
                  ),
                  WidgetSpan(
                      child: Transform.translate(
                          offset: Offset(0, -0.001 * screenHeight),
                          child: Text(
                            '°',
                            style: TextStyle(
                                fontSize: fontsize * 0.030,
                                color: Theme.of(context).splashColor),
                          ))),
                  TextSpan(
                    text: '/',
                    style: TextStyle(
                        fontSize: fontsize * 0.03,
                        color: Theme.of(context).splashColor),
                  ),
                  TextSpan(
                    text: (minTemp).toInt().toString(),
                    style: TextStyle(
                        fontSize: fontsize * 0.03,
                        color: Theme.of(context).splashColor),
                  ),
                  WidgetSpan(
                      child: Transform.translate(
                          offset: Offset(0, -0.001 * screenHeight),
                          child: Text(
                            '°',
                            style: TextStyle(
                                fontSize: fontsize * 0.030,
                                color: Theme.of(context).splashColor),
                          ))),
                ])),
          ],
        )
      ],
    );
  }
}
