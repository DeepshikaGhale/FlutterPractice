import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.green,
      //
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkGrey,
      buttonColor: mediumGreen,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        // color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(headline6: TextStyle(color: Colors.white, fontSize: 20)),
      )
      // primaryTextTheme: GoogleFonts.latoTextTheme()
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkGrey,
      buttonColor: mediumGreen,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white),
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme,
      ));

  //Colors
  static Color lightgreen = Colors.green.shade50;
  static Color darkGrey = Colors.grey.shade900;
  static Color mediumGreen = Colors.green.shade500;
  static Color lightGreen = Colors.green.shade900;
}
