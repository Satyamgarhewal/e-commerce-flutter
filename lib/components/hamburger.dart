import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

class Hamburger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.7],
                colors: [kBasicOrange, kBasicPink],
              ),
            ),
            accountEmail: Text(
              'satyam@gmail.com',
              style: TextStyle(
                color: kBasicTextColor,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.bold,
              ),
            ),
            accountName: Text(
              'Satyam Garhewal',
              style: TextStyle(
                color: kBasicTextColor,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.bold,
              ),
            ),
            // ignore: missing_required_param
            currentAccountPicture: Container(
              // padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
              child: const Center(
                  child: CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/male-512.png'),
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/myprofile');
            },
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                color: kBasicTextColor,
              ),
              title: Text(
                'My Profile',
                style: TextStyle(color: kBasicTextColor),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.message,
              color: kBasicTextColor,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(color: kBasicTextColor),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: kBasicTextColor,
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: kBasicTextColor),
            ),
          ),
        ],
      ),
    );
  }
}
