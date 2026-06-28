import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  MyTheme._(); // Prevent instantiation

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    textTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple[100],
      centerTitle: true,
      titleTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    textTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple,
      centerTitle: true,
      titleTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
