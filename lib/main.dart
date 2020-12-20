import 'package:flutter/material.dart';

// pages
import 'pages/MyProfile.dart';
import 'pages/BottomNavPage.dart';
import 'pages/Login.dart';
import 'pages/Welcome.dart';
import 'pages/SignUp.dart';
import 'pages/Notifications.dart';
import 'pages/ShoppingBag.dart';
import 'pages/Search.dart';

// utils
import 'package:firebase_core/firebase_core.dart';

//utils
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        //   accentColor: Color(0xFF363B64),
        //   brightness: Brightness.dark,
        primaryColor: kBasicTextColor,
      ),
      initialRoute: '/',
      routes: {
        '/home': (context) => BottomNavPage(),
        '/': (context) => Welcome(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUp(),
        '/myprofile': (context) => MyProfile(),
        '/notifications': (context) => Notifications(),
        '/shoppingbag': (context) => ShoppingBag(),
        '/search': (context) => Search()
      },
    );
  }
}
