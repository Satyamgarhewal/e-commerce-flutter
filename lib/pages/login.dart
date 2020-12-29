import 'package:e_commerce/pages/SignUp.dart';
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';

//components
import 'package:e_commerce/components/guestOnboardHeader.dart';
import 'package:e_commerce/components/SecondaryHeading.dart';
import 'package:e_commerce/components/PageHeading.dart';
import 'package:e_commerce/components/LottiAsset.dart';
import 'package:e_commerce/components/EmailTextField.dart';
import 'package:e_commerce/components/EnterValidMessage.dart';
import 'package:e_commerce/components/PasswordTextField.dart';
import 'package:e_commerce/components/BasicButton.dart';

// utils
import 'package:e_commerce/utils/stringConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:e_commerce/models/userLogin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isEmailValid = true;
  bool isPwdValid = true;
  String email;
  String password;
  bool showSpinner = false;
  final String pageName = 'login';
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

  void _invalidUserDialog(String title, String content, context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              FlatButton(
                color: kBasicTextColor,
                child: Text(
                  "OK",
                  style: TextStyle(fontFamily: 'Comfortaa'),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void handleOnPress() async {
    if (isEmailValid && email.length > 0 && isPwdValid && password.length > 0) {
      setState(() {
        showSpinner = true;
      });
      dynamic newUser = await signIn(email.trim(), password);
      if (newUser == true) {
        setState(() {
          showSpinner = false;
          Navigator.pushNamed(context, '/home');
        });
      } else if (newUser == false) {
        final String title = 'Invalid email or password';
        final String content =
            'We were not able to login, please enter valid email and password';
        setState(() {
          showSpinner = false;
        });
        _invalidUserDialog(title, content, context);
      }
    } else {
      print('setting state');
      setState(() {
        isEmailValid = false;
        isPwdValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: GuestOnboardHeader(),
        body: SafeArea(
          child: Column(children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                children: [
                  Column(children: [
                    PageHeading(
                      heading: WELCOME_BACK,
                    ),
                    SecondaryHeading(heading: LOGIN_TO_CONTINUE),
                  ]),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 10.0,
                    ),
                    child: LottieAsset(
                      asset: 'assets/lf30_editor_ly9ftyq9 (2).json',
                    ),
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
                  !isEmailValid
                      ? EnterValidMessage(
                          invalidMesage: ENTER_VALID_EMAIL,
                        )
                      : SizedBox(
                          height: 20.0,
                        ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: PASSWORD,
                      prefixIcon: Icon(Icons.lock_outlined),
                    ),
                    onChanged: (value) {
                      handlePasswordChange(value);
                    },
                    obscureText: true,
                  ),
                  !isPwdValid
                      ? EnterValidMessage(
                          invalidMesage: ENTER_VALID_PWD,
                        )
                      : SizedBox(
                          height: 20.0,
                        ),
                  BasicButton(
                    handleOnPress: handleOnPress,
                    name: PROCEED,
                  ),
                  FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Text("Don't have an account? Sign up here"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
