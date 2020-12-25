import 'package:e_commerce/utils/stringConstants.dart';
import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/utils/common.dart';
import 'package:e_commerce/utils/localStorageConstants.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Hamburger extends StatefulWidget {
  @override
  _HamburgerState createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  final _auth = FirebaseAuth.instance;

  String _email = '';
  void fetchUserDetails() async {
    fetchUserEmail();
  }

  void fetchUserEmail() async {
    final String fetchedEmail = await getLocalStorage(EMAIL, STRING);
    setState(() {
      _email = fetchedEmail;
    });
  }

  void logoutUser() {
    deleteLocalStorage(EMAIL);
    deleteLocalStorage(TOKEN);
    _auth.signOut();
    Navigator.pushNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

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
              _email,
              style: TextStyle(
                color: kBasicTextColor,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.bold,
              ),
            ),
            accountName: Text(
              'Elon',
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
              logoutUser();
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
