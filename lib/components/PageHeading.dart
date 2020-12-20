import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

// ignore: must_be_immutable
class PageHeading extends StatelessWidget {
  PageHeading({@required this.heading});
  String heading;
  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: TextStyle(
          color: kBasicTextColor,
          fontSize: 30.0,
          fontWeight: FontWeight.w900,
          fontFamily: 'Comfortaa'),
    );
  }
}
