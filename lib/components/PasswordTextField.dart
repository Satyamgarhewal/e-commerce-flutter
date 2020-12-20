import 'package:flutter/material.dart';

// utils
import 'package:flutter/services.dart';
import 'package:e_commerce/utils/constants.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatelessWidget {
  PasswordTextField({
    @required this.hintText,
    @required this.handlePasswordChange,
  });
  String hintText;
  Function handlePasswordChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: kBasicTextColor, fontSize: 10.0, height: 2.0),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: TextStyle(color: kBasicTextColor, fontSize: 15.0),
        border: UnderlineInputBorder(
            borderSide: const BorderSide(
          color: Colors.white,
          width: 10.0,
        )),
      ),
      obscureText: true,
      // ignore: deprecated_member_use
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-z0-9]")),
        FilteringTextInputFormatter.deny(RegExp("[_`^/]")),
      ],
      onChanged: (value) {
        handlePasswordChange(value);
      },
    );
  }
}
