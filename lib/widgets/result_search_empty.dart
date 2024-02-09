import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResultSearchEmpty extends StatelessWidget {
  const ResultSearchEmpty({
    super.key,
    required this.serachName,
  });

  final String serachName;

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;
    final screenWidth = screensize.width;
    final fontsize = screenHeight;
    return Column(
      children: [
        Image.asset('assets/resulterror.jpg',
            width: double.infinity,
            height: screenHeight * 0.4,
            fit: BoxFit.cover),
        Text(
            "${tr("Sorry, There are'nt found any results about : ")} $serachName",
            textAlign: TextAlign.center,
            // overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 4,
            style: TextStyle(
              fontSize: fontsize * 0.03,
            )),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.05),
          ),
          height: screenHeight * 0.07,
          color: Colors.indigo[300],
          child: Text(tr('Try search again'),
              style:
                  TextStyle(fontSize: fontsize * 0.024, color: Colors.black)),
        )
      ],
    );
  }
}
