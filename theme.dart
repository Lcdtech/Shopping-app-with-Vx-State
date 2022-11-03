import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      // ignore: deprecated_member_use
      buttonColor: darkBluishColor,
      // ignore: deprecated_member_use
      accentColor: darkBluishColor,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
          titleTextStyle: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          // ignore: deprecated_member_use
          textTheme: Theme.of(context).textTheme));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      // ignore: deprecated_member_use
      buttonColor: lightBluishColor,
      // ignore: deprecated_member_use
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0.0,

          // ignore: deprecated_member_use
          textTheme: Theme.of(context).textTheme));

  // Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}