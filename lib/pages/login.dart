import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isEmail = true;
  void _handleEmailChange(value) {
    if ((!value.contains('@') || !value.contains('.com')) && value.length > 0) {
      setState(() {
        isEmail = false;
      });
    }
    if (value.contains('.com') || value.length == 0) {
      setState(() {
        isEmail = true;
      });
    }
  }

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
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: Text(
                      'Welcome back,',
                      style: TextStyle(
                          color: kBasicTextColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Comfortaa'),
                    ),
                  ),
                  Text(
                    'Login to continue',
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
                      'assets/lf30_editor_ly9ftyq9 (2).json',
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
                  !isEmail
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: FlatButton(
                      color: kBasicOrange,
                      child: Text(
                        'Proceed',
                        style: TextStyle(
                            color: kBasicTextColor,
                            fontSize: 15.0,
                            fontFamily: 'Comfortaa',
                            fontWeight: FontWeight.w500),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      onPressed: () {
                        print('on pressed clicked');
                      },
                    ),
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
