import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class Firstcontainer extends StatelessWidget {
  const Firstcontainer({
    super.key,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.height,
    required this.color,
    required this.mainAxisAlignment,
    required this.fontsizeTemp,
    required this.fontsizedegree,
    required this.fontsizeC,
    required this.offsetDegree,
    required this.offsetC,
    this.elevatedButton,
    this.reigonName,
  });

  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStateName;
  final double height;
  final Color? color;
  final MainAxisAlignment mainAxisAlignment;
  final double fontsizeTemp;
  final double fontsizedegree;
  final double fontsizeC;
  final double offsetDegree;
  final double offsetC;
  final Widget? elevatedButton;
  final String? reigonName;

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    final screenWidth = screensize.width;
    final fontsize = screenHeight;
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(25)),
        height: screenHeight * height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: mainAxisAlignment,
          children: [
            RichText(
                textDirection: TextDirection.ltr,
                text: TextSpan(children: [
                  TextSpan(
                    text: (temp).toInt().toString(),
                    style: TextStyle(
                        fontSize: fontsize * fontsizeTemp,
                        color: Theme.of(context).splashColor),
                  ),
                  WidgetSpan(
                    child: Transform.translate(
                      offset: Offset(0, offsetDegree * screenHeight),
                      child: Text(
                        '°',
                        style: TextStyle(
                            fontSize: fontsize * fontsizedegree,
                            color: Theme.of(context).splashColor),
                      ),
                    ),
                  ),
                  WidgetSpan(
                    child: Transform.translate(
                      offset: Offset(0, offsetC * screenHeight),
                      child: Text(
                        'c',
                        style: TextStyle(
                            fontSize: fontsize * fontsizeC,
                            color: Theme.of(context).splashColor),
                      ),
                    ),
                  ),
                ])),
            SizedBox(height: screenHeight * 0.07),
            Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    textDirection: TextDirection.ltr,
                    text: TextSpan(children: [
                      TextSpan(
                        text: (maxTemp).toInt().toString(),
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
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '/',
                        style: TextStyle(
                            fontSize: fontsize * 0.03,
                            color: Theme.of(context).splashColor),
                      ),
                      TextSpan(
                        text: (minTemp).toInt().toString(),
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
                          ),
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: screenWidth * 0.02,
                        ),
                      ),
                      TextSpan(
                        text: weatherStateName,
                        style: TextStyle(
                            color: Theme.of(context).splashColor,
                            fontSize: fontsize * 0.025),
                      ),
                    ])),
              ],
            ),
            elevatedButton ?? Container(),
          ],
        ),
      ),
    );
  }
}
