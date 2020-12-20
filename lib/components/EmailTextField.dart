import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

// ignore: must_be_immutable
class EmailTextField extends StatelessWidget {
  EmailTextField({
    @required this.hint,
    @required this.handleEmailChange,
  });
  String hint;
  Function handleEmailChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: kBasicTextColor,
        fontSize: 15.0,
        height: 2.0,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: hint,
        hintStyle: TextStyle(color: kBasicTextColor),
        border: UnderlineInputBorder(),
      ),
      onChanged: (value) {
        handleEmailChange(value);
      },
    );
  }
}
