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

  void handleOnPress() async {
    if (isEmailValid && email.length > 0 && isPwdValid && password.length > 0) {
      setState(() {
        showSpinner = true;
      });

      try {
        final user = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        print('user------------- $user');
        if (user != null) {
          setState(() {
            showSpinner = false;
          });
          Navigator.pushNamed(context, '/home');
        }
      } catch (err) {
        print(err);
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
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: PageHeading(
                    heading: WELCOME_BACK,
                  ),
                ),
                SecondaryHeading(heading: LOGIN_TO_CONTINUE),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  child: LottieAsset(
                      asset: 'assets/lf30_editor_ly9ftyq9 (2).json'),
                ),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    child: EmailTextField(
                        handleEmailChange: handleEmailChange, hint: EMAIL)),
                !isEmailValid
                    ? EnterValidMessage(
                        invalidMesage: ENTER_VALID_EMAIL,
                      )
                    : SizedBox(
                        height: 30.0,
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                  ),
                  child: PasswordTextField(
                    handlePasswordChange: handlePasswordChange,
                    hintText: PASSWORD,
                  ),
                ),
                !isPwdValid
                    ? EnterValidMessage(
                        invalidMesage: ENTER_VALID_PWD,
                      )
                    : SizedBox(
                        height: 40.0,
                      ),
                SizedBox(
                  height: 30.0,
                ),
                BasicButton(
                  handleOnPress: handleOnPress,
                  name: PROCEED,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
