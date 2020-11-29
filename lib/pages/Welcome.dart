import 'dart:ui';

import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

// components
import 'package:lottie/lottie.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [kBasicOrange, kBasicPink],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.7])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 100.0, 0, 0),
                    child: Text(
                      'Hello,',
                      style: TextStyle(
                          color: kBasicTextColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Comfortaa'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'Please login or sign up',
                      style: TextStyle(
                          color: kBasicTextColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Comfortaa'),
                    ),
                  ),
                  Lottie.asset(
                    'assets/lf30_editor_rjtsruzw.json',
                    repeat: true,
                    reverse: false,
                    animate: true,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    color: kBasicOrange,
                    minWidth: 200.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13.0),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: kBasicTextColor,
                          fontSize: 15.0,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FlatButton(
                    color: kBasicOrange,
                    minWidth: 200.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13.0),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: kBasicTextColor,
                          fontSize: 15.0,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
