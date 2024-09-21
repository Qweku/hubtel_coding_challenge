import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge/theme/light_mode.dart';
import 'package:hubtel_coding_challenge/views/home_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // Sizer here is used to control sizes according to the 
    // device screen height and width
    return Sizer(builder: (context, deviceType, orientation) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hubtel Coding Challenge',
        theme: lightMode,
        home: const MyHomePage(),
      );
    });
  }
}

