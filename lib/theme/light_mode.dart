import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness:  Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: const Color.fromARGB(225, 230, 234,237),
    primaryContainer: const Color.fromARGB(255, 243, 243, 243),
    secondary: Colors.grey.shade400,
    tertiary: const Color.fromARGB(225, 156, 171, 184),
    tertiaryContainer: Colors.white,
    inversePrimary: Colors.grey.shade900
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.grey[800],
    displayColor: Colors.black,
    fontFamily: "NunitoSans-Regular"
  )
);
