import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';
import 'package:e_commerce/utils/stringConstants.dart';

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
  bool isPwdValid = true;
  bool isConfirmPwdValid = true;
  // final bottom = MediaQuery.of(context).viewInsets.bottom;

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
        password = value;
      });
    }
  }

  void handleConfirmPwdChange(value) {
    if (value == password || value.length < 1) {
      setState(() {
        isConfirmPwdValid = true;
      });
    } else if (value != password && isConfirmPwdValid) {
      setState(() {
        isConfirmPwdValid = false;
      });
    }
  }

  void handleProceed() {
    print('Proceed button clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: GuestOnboardHeader(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [kBasicOrange, kBasicPink],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.7],
          ),
        ),
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                      child: PageHeading(
                        heading: CREATE_YOUR_ACCOUNT,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SecondaryHeading(heading: SIGNUP_AND_GET_STARTED),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 10.0,
                      ),
                      child: LottieAsset(
                          asset: 'assets/lf30_editor_iwwdd5x3.json'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10.0),
                      child: EmailTextField(
                        handleEmailChange: handleEmailChange,
                        hint: EMAIL,
                      ),
                    ),
                    !isEmailValid
                        ? EnterValidMessage(invalidMesage: ENTER_VALID_EMAIL)
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
                        )),
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
                    Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.0,
                        ),
                        child: PasswordTextField(
                          handlePasswordChange: handleConfirmPwdChange,
                          hintText: CONFIRM_PASSWORD,
                        )),
                    !isConfirmPwdValid
                        ? EnterValidMessage(
                            invalidMesage: PASSWORD_DOESNT_MATCH)
                        : SizedBox(
                            height: 0.0,
                          ),
                    SizedBox(
                      height: 30.0,
                    ),
                    BasicButton(
                      handleOnPress: handleProceed,
                      name: PROCEED,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
