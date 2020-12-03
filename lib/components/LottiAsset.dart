import 'package:flutter/material.dart';

// utils
import 'package:lottie/lottie.dart';

class LottieAsset extends StatelessWidget {
  LottieAsset({@required this.asset});
  String asset;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      asset,
      repeat: true,
      reverse: false,
      animate: true,
    );
  }
}
