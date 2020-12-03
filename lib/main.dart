import 'package:flutter/material.dart';
import 'pages/Dashboard.dart';
import 'pages/MyProfile.dart';
import 'pages/BottomNavPage.dart';
import 'pages/Login.dart';
import 'pages/Welcome.dart';
import 'pages/SignUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //   accentColor: Color(0xFF363B64),
        //   brightness: Brightness.dark,
        primaryColor: Color(0xffFF9780),
      ),
      initialRoute: '/',
      routes: {
        // '/': (context) => BottomNavPage(),
        '/': (context) => Welcome(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUp(),
        '/myprofile': (context) => MyProfile(),
      },
    );
  }
}
