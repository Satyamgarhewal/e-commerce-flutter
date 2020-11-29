import 'package:flutter/material.dart';

// components
import 'package:e_commerce/components/pageHeader.dart';
import 'package:e_commerce/components/hamburger.dart';
// utils
import 'package:e_commerce/utils/constants.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Hamburger(),
      appBar: PageHeader(header: 'My Profile'),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 0.7],
          colors: [kBasicOrange, kBasicPink],
        )),
      ),
    );
  }
}

// class BackgroundGradient extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               stops: [0.2, 0.7],
//               colors: [kBasicOrange, kBasicPink])),
//     );
//   }
// }
