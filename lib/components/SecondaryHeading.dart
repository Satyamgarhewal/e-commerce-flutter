import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

// ignore: must_be_immutable
class SecondaryHeading extends StatelessWidget {
  SecondaryHeading({@required this.heading});
  String heading;
  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: TextStyle(
          color: kBasicTextColor,
          fontSize: 15.0,
          fontWeight: FontWeight.w300,
          fontFamily: 'Comfortaa'),
    );
  }
}
