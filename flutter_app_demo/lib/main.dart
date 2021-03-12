import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Screens/Container.dart';
import 'package:flutter_app_demo/Screens/FirstScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('I Am Rich'),
              backgroundColor: Colors.blueGrey[900],
            ),
            backgroundColor: Colors.black,
            body: MyContainer()));
  }
}
