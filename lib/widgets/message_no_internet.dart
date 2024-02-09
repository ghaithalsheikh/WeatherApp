import 'package:flutter/material.dart';

class MessagesErrore extends StatelessWidget {
  const MessagesErrore({super.key});

  Future<void> showSnackBar(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    const snackBar = SnackBar(
        content:
            Center(child: Text('Try again please there are Not internet')));
    scaffoldMessenger.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
