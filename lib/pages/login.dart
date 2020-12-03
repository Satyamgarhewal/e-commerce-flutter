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
import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce/utils/stringConstants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isEmailValid = true;
  bool isPwdValid = true;

  void handleEmailChange(value) {
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

  void handlePasswordChange(value) {
    if (value.length < 6 && value.length > 0) {
      setState(() {
        isPwdValid = false;
      });
    } else {
      setState(() {
        isPwdValid = true;
      });
    }
  }

  void handleOnPress() {
    print('Handle press clicked');
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10.0),
                      child: EmailTextField(
                          handleEmailChange: handleEmailChange, hint: EMAIL)),
                  !isEmailValid
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40.0),
                                child: EnterValidMessage(
                                  invalidMesage: ENTER_VALID_EMAIL,
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
                          height: 0.0,
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
            )
          ],
        ),
      ),
    );
  }
}
