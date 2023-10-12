import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    highlightColor: Colors.black,
    canvasColor: creamColor,

    textTheme: TextTheme(titleLarge: TextStyle(color: darkBlueColor)),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(darkGreen),

        ),

    ),

    appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: darkGreen),
        color: Colors.white,
        elevation: 1.0,
        iconTheme: IconThemeData(color: darkBlueColor),
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
        titleTextStyle: Theme.of(context).textTheme.titleLarge
    )
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(brightness: Brightness.dark,
      primarySwatch: Colors.green,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      highlightColor: Colors.white,
      textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(darkGreen))),

      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: darkGreen),
          color: darkCreamColor,
          elevation: 1.0,
          iconTheme: const IconThemeData(color: Colors.white),
          toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
          titleTextStyle: Theme.of(context).textTheme.titleLarge));

  // Colors
  static Color darkBlueColor = const Color(0xff403b58);
  static Color darkGreen = const Color(0xff066e62);
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = const Color(0xff1e1e3a);
}