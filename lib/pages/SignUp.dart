import 'dart:ui';

import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/stringConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:e_commerce/components/AlertModal.dart';
import 'package:e_commerce/models/userSignUp.dart';

// components
import 'package:e_commerce/components/guestOnboardHeader.dart';
import 'package:e_commerce/components/EmailTextField.dart';
import 'package:e_commerce/components/EnterValidMessage.dart';
import 'package:e_commerce/components/PageHeading.dart';
import 'package:e_commerce/components/SecondaryHeading.dart';
import 'package:e_commerce/components/LottiAsset.dart';
import 'package:e_commerce/components/PasswordTextField.dart';
import 'package:e_commerce/components/BasicButton.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isEmailValid = true;
  String password;
  String confirmPassword;
  String email;
  bool isPwdValid = true;
  bool isConfirmPwdValid = true;
  bool showSpinner = false;
  bool errorDialogue = false;
  final String pageName = 'signup';
  final _auth = FirebaseAuth.instance;

  void handleEmailChange(value) {
    if ((!value.contains('@') || !value.contains('.com')) && value.length > 0) {
      setState(() {
        isEmailValid = false;
      });
    }
    if (value.contains('.com') || value.length == 0) {
      setState(() {
        isEmailValid = true;
        email = value;
      });
    }
  }

  void handlePasswordChange(value) {
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

  void handleConfirmPwdChange(value) {
    if (value == password || value.length < 1) {
      setState(() {
        isConfirmPwdValid = true;
        confirmPassword = value;
      });
    } else if (value != password && isConfirmPwdValid) {
      setState(() {
        isConfirmPwdValid = false;
      });
    }
  }

  void _invalidRegistrationDialog(String title, String content, context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(color: kBasicTextColor),
            ),
            content: Text(content),
            actions: [
              FlatButton(
                color: kBasicTextColor,
                child: Text('OK', style: TextStyle(fontFamily: 'Comfortaa')),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void handleProceed() async {
    if (email.length > 0 &&
        email.contains('@') &&
        email.contains('.com') &&
        password.length >= 6 &&
        confirmPassword == password) {
      setState(() {
        showSpinner = true;
      });
      dynamic newUser = await signUp(email.trim(), password);
      if (newUser == true) {
        setState(() {
          showSpinner = false;
          Navigator.pushNamed(context, '/home');
        });
      } else {
        String title = 'Account already exists';
        String content =
            'The email address is already in use by another account.';
        setState(() {
          showSpinner = false;
        });
        _invalidRegistrationDialog(title, content, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: GuestOnboardHeader(),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  children: [
                    errorDialogue
                        ? AlertModal()
                        : SizedBox(
                            height: 0.0,
                          ),
                    Column(
                      children: [
                        PageHeading(
                          heading: CREATE_YOUR_ACCOUNT,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SecondaryHeading(heading: SIGNUP_AND_GET_STARTED),
                      ],
                    ),
                    LottieAsset(asset: 'assets/lf30_editor_iwwdd5x3.json'),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Full name',
                          prefixIcon: Icon(Icons.person_outlined)),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      onChanged: (value) {
                        handleEmailChange(value);
                      },
                    ),
                    // EmailTextField(
                    //   handleEmailChange: handleEmailChange,
                    //   hint: EMAIL,
                    // ),
                    !isEmailValid
                        ? EnterValidMessage(invalidMesage: ENTER_VALID_EMAIL)
                        : SizedBox(
                            height: 20.0,
                          ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_outlined),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        handlePasswordChange(value);
                      },
                    ),
                    // PasswordTextField(
                    //   handlePasswordChange: handlePasswordChange,
                    //   hintText: PASSWORD,
                    // ),
                    !isPwdValid
                        ? EnterValidMessage(
                            invalidMesage: ENTER_VALID_PWD,
                          )
                        : SizedBox(
                            height: 20.0,
                          ),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock_open_outlined),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        handleConfirmPwdChange(value);
                      },
                    ),
                    !isConfirmPwdValid
                        ? EnterValidMessage(
                            invalidMesage: PASSWORD_DOESNT_MATCH)
                        : SizedBox(
                            height: 20.0,
                          ),
                    RaisedButton(
                      onPressed: () {
                        handleProceed();
                      },
                      child: Text(
                        PROCEED,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w500),
                      ),
                    )
                    // BasicButton(
                    //   handleOnPress: handleProceed,
                    //   name: PROCEED,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
