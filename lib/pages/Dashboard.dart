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
      body: Container(),
    );
  }
}
