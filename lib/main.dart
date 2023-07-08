// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'Screens/connectedDevices.dart';
import 'Screens/homePage.dart';
import 'Screens/temperature.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

      /*
      Please Note : 
      to Switch between Screens replace the widght after home with 
      one of the followin Screen
      1 HomePage
      2 Temperature
      3 Devices
       */
    );
  }
}
