import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({@required this.indexChange});
  final Function indexChange;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      iconSize: 30.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          // ignore: deprecated_member_use
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          // ignore: deprecated_member_use
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          // ignore: deprecated_member_use
          title: Text(''),
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        widget.indexChange(index);
      },
    );
  }
}
