import 'dart:ui';

import 'package:e_commerce/utils/stringConstants.dart';
import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

// components
import 'package:e_commerce/components/PageHeading.dart';
import 'package:e_commerce/components/SecondaryHeading.dart';
import 'package:e_commerce/components/LottiAsset.dart';
import 'package:e_commerce/services/checkInternet.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
    CheckInternet().checkConnection(context);
  }

  @override
  void dispose() {
    CheckInternet().listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 70.0),
                children: [
                  Column(
                    children: [
                      PageHeading(heading: HELLO),
                      SizedBox(height: 10.0),
                      SecondaryHeading(
                        heading: PLEASE_LOGIN_OR_SIGNUP,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  LottieAsset(asset: 'assets/lf30_editor_rjtsruzw.json'),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: kBasicTextColor,
                    elevation: 10.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: kBasicTextColor,
                    elevation: 10.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13.0),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
