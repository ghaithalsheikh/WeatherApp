import 'package:flutter/material.dart';
import 'package:weather/widgets/search_of_bar.dart';

class SearchBarView extends StatelessWidget {
  const SearchBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    final screenHeight = screensize.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          textDirection: TextDirection.rtl,
          children: [
            const Flexible(child: SearchOfBar()),
            IconButton(
              color: Theme.of(context).splashColor,
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: screenHeight * 0.05,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(),
    );
  }
}
