import 'dart:ui';

import 'package:e_commerce/utils/stringConstants.dart';
import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

// components
import 'package:e_commerce/components/PageHeading.dart';
import 'package:e_commerce/components/SecondaryHeading.dart';
import 'package:e_commerce/components/LottiAsset.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
                    child: PageHeading(heading: HELLO),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: SecondaryHeading(
                        heading: PLEASE_LOGIN_OR_SIGNUP,
                      )),
                  LottieAsset(asset: 'assets/lf30_editor_rjtsruzw.json'),
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
