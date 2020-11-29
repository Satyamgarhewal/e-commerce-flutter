import 'package:flutter/material.dart';

// pages
import 'package:e_commerce/pages/Dashboard.dart';
import 'package:e_commerce/pages/MyProfile.dart';
import 'package:e_commerce/components/BottomNavigationBar.dart';
import 'package:e_commerce/pages/Settings.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;
  final tabs = [
    Dashboard(),
    MyProfile(),
    Settings(),
  ];
  void handleIndexChange(int index) => {
        setState(() {
          _currentIndex = index;
        })
      };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigation(
        indexChange: this.handleIndexChange,
      ),
    );
  }
}
