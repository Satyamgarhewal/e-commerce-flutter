import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Hamburger extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
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
              Icons.settings,
              color: kBasicTextColor,
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: kBasicTextColor),
            ),
          ),
          GestureDetector(
            onTap: () {
              _auth.signOut();
              Navigator.pushNamed(context, '/login');
            },
            child: ListTile(
              leading: Icon(Icons.logout, color: kBasicTextColor),
              title: Text(
                'Logout',
                style: TextStyle(color: kBasicTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
