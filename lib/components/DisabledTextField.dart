import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

// ignore: must_be_immutable
class DisabledTextField extends StatelessWidget {
  DisabledTextField({
    @required this.hint,
  });
  String hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: false,
      focusNode: FocusNode(),
      enableInteractiveSelection: false,
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
    );
  }
}
