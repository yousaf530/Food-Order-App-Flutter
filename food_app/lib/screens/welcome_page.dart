import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: Container(
          color: Colors.blue,
          child: Center(child: Image.asset('images/logo.png')),
        ),
      ),
      Expanded(
        child: Container(color: Colors.green),
      ),
    ]));
  }
}
