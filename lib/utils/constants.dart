import 'package:flutter/material.dart';

const kBasicTextColor = Color(0xFF363B64);
const kBasicOrange = Color(0xffFF9780);
const kBasicPink = Color(0xFFFAE1F7);

class BackgroundGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.7],
              colors: [kBasicOrange, kBasicPink])),
    );
  }
}
