import 'package:flutter/material.dart';

class OurTheme {
  Color _lightGrey = Color.fromARGB(255, 164, 164, 164);
  Color _darkerGrey = Color.fromARGB(255, 119, 124, 135);
  Color _darkBlue = Color(0xFF363B64);
  ThemeData buildTheme() {
    return ThemeData(
        canvasColor: Colors.white,
        primaryColor: _darkBlue,
        accentColor: _lightGrey,
        secondaryHeaderColor: _darkerGrey,
        hintColor: _lightGrey,
        inputDecorationTheme: InputDecorationTheme(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: _lightGrey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: _darkerGrey),
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: _darkBlue,
          minWidth: 300.0,
          height: 40.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ));
  }
}
