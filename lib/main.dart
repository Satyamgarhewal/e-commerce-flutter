import 'package:e_commerce/utils/ourTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/navigation_provider.dart';

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
import 'package:e_commerce/providers/userData.dart';

//utils
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final dynamic data = 'State data';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserData>(
      create: (context) => UserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        initialRoute: '/',
        routes: {
          '/': (context) => Welcome(),
          '/home': (context) => BottomNavPage(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignUp(),
          '/myprofile': (context) => MyProfile(),
          '/notifications': (context) => Notifications(),
          '/shoppingbag': (context) => ShoppingBag(),
          '/search': (context) => Search()
        },
      ),
    );
  }
}
