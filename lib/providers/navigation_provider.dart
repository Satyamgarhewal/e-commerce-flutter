// pages
import 'package:e_commerce/pages/MyProfile.dart';
import 'package:e_commerce/pages/BottomNavPage.dart';
import 'package:e_commerce/pages/Login.dart';
import 'package:e_commerce/pages/Welcome.dart';
import 'package:e_commerce/pages/SignUp.dart';
import 'package:e_commerce/pages/Notifications.dart';
import 'package:e_commerce/pages/ShoppingBag.dart';
import 'package:e_commerce/pages/Search.dart';

var appRoutes = [
  {
    'path': '/',
    'component': Welcome(),
  },
  {
    'path': '/home',
    'component': BottomNavPage(),
  },
  {
    'path': '/login',
    'component': LoginScreen(),
  },
  {
    'path': '/signup',
    'component': SignUp,
  },
  {
    'path': '/myprofile',
    'component': MyProfile,
  },
  {
    'path': '/notfications',
    'component': Notifications,
  },
  {
    'path': '/shoppingbag',
    'component': ShoppingBag,
  },
  {
    'path': '/search',
    'component': Search,
  }
];
