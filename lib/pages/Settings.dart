import 'package:flutter/material.dart';

//  components
import 'package:e_commerce/components/pageHeader.dart';
import 'package:e_commerce/components/hamburger.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Hamburger(),
      appBar: PageHeader(
        header: 'Settings',
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [kBasicOrange, kBasicPink],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.7],
        )),
      ),
    );
    // return BackgroundGradient();
  }
}
