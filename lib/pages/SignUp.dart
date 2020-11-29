import 'dart:ui';

import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

// components
import 'package:e_commerce/components/guestOnboardHeader.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isEmailValid = true;
  String password;
  bool isPwdValid = true;
  bool isConfirmPwdValid = true;

  void _handleEmailChange(value) {
    if ((!value.contains('@') || !value.contains('.com')) && value.length > 0) {
      setState(() {
        isEmailValid = false;
      });
    }
    if (value.contains('.com') || value.length == 0) {
      setState(() {
        isEmailValid = true;
      });
    }
  }

  void _handlePasswordChange(value) {
    if (value.length < 6 && value.length > 0) {
      setState(() {
        isPwdValid = false;
      });
    } else {
      setState(() {
        isPwdValid = true;
        password = value;
      });
    }
  }

  void _handleConfirmPwdChange(value) {
    if (value == password) {
      setState(() {
        isConfirmPwdValid = true;
      });
    } else if (value != password && isConfirmPwdValid) {
      setState(() {
        isConfirmPwdValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GuestOnboardHeader(),
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kBasicOrange, kBasicPink],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.7],
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                    child: Text(
                      'Create your account',
                      style: TextStyle(
                          color: kBasicTextColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Comfortaa'),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Sign up and get started',
                    style: TextStyle(
                        color: kBasicTextColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Comfortaa'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 10.0,
                    ),
                    child: Lottie.asset(
                      'assets/lf30_editor_iwwdd5x3.json',
                      repeat: true,
                      reverse: false,
                      animate: true,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: TextField(
                      style: TextStyle(
                        color: kBasicTextColor,
                        fontSize: 15.0,
                        height: 2.0,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: 'Email',
                        hintStyle: TextStyle(color: kBasicTextColor),
                        border: UnderlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _handleEmailChange(value);
                      },
                    ),
                  ),
                  !isEmailValid
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40.0),
                                child: Text(
                                  '* Enter valid email',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.red,
                                      fontSize: 10.0),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                              )
                            ])
                      : SizedBox(
                          height: 10.0,
                        ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                    ),
                    child: TextField(
                      style: TextStyle(
                          color: kBasicTextColor, fontSize: 10.0, height: 2.0),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(color: kBasicTextColor, fontSize: 15.0),
                        border: UnderlineInputBorder(
                            borderSide: const BorderSide(
                          color: Colors.white,
                          width: 10.0,
                        )),
                      ),
                      obscureText: true,
                      // ignore: deprecated_member_use
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-z0-9]")),
                        FilteringTextInputFormatter.deny(RegExp("[_`^/]")),
                      ],
                      onChanged: (value) {
                        _handlePasswordChange(value);
                      },
                    ),
                  ),
                  !isPwdValid
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 10.0),
                                child: Text(
                                  '* Enter valid Password',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.red,
                                      fontSize: 10.0),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                              )
                            ])
                      : SizedBox(
                          height: 0.0,
                        ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                    ),
                    child: TextField(
                      style: TextStyle(
                          color: kBasicTextColor, fontSize: 10.0, height: 2.0),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: 'Confirm password',
                        hintStyle:
                            TextStyle(color: kBasicTextColor, fontSize: 15.0),
                        border: UnderlineInputBorder(
                            borderSide: const BorderSide(
                          color: Colors.white,
                          width: 10.0,
                        )),
                      ),
                      obscureText: true,
                      // ignore: deprecated_member_use
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-z0-9]")),
                        FilteringTextInputFormatter.deny(RegExp("[_`^/]")),
                      ],
                      onChanged: (value) {
                        _handleConfirmPwdChange(value);
                      },
                    ),
                  ),
                  !isConfirmPwdValid
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 10.0),
                                child: Text(
                                  '* Password doesn\'t match',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.red,
                                      fontSize: 10.0),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                              )
                            ])
                      : SizedBox(
                          height: 0.0,
                        ),
                  SizedBox(
                    height: 30.0,
                  ),
                  FlatButton(
                    color: kBasicOrange,
                    minWidth: 200.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 13.0),
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                            color: kBasicTextColor,
                            fontSize: 15.0,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () {
                      print('on pressed clicked');
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
