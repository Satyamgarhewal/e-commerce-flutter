import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';

// Components
import 'package:e_commerce/components/pageHeader.dart';
import 'package:e_commerce/components/hamburger.dart';

// utils
// import 'package:e_commerce/utils/constants.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Hamburger(),
      appBar: PageHeader(header: 'Dashboard'),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.7],
            colors: [
              kBasicOrange,
              kBasicPink,
            ],
          ),
        ),
      ),
    );
  }
}
