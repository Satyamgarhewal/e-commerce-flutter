import 'package:flutter/material.dart';

//  components
import 'package:e_commerce/components/pageHeader.dart';
import 'package:e_commerce/components/hamburger.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Hamburger(),
      appBar: PageHeader(
        header: 'Settings',
      ),
      body: SafeArea(child: Container()),
    );
    // return BackgroundGradient();
  }
}
