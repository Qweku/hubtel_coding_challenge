import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness:  Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.grey.shade300,
    primaryContainer: const Color.fromARGB(255, 243, 243, 243),
    secondary: Colors.grey.shade400,
    tertiary: Colors.grey.shade500,
    tertiaryContainer: Colors.white,
    inversePrimary: Colors.grey.shade900
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.grey[800],
    displayColor: Colors.black,
    fontFamily: "Lato"
  )
);
