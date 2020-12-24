import 'package:flutter/material.dart';

// components
import 'package:e_commerce/components/pageHeader.dart';
import 'package:e_commerce/components/hamburger.dart';
import 'package:e_commerce/components/EmailTextField.dart';
import 'package:e_commerce/components/DisabledTextField.dart';

class MyProfile extends StatelessWidget {
  void handleFirstName(value) {
    print('handleFirstname $value');
  }

  void handleLastName(value) {
    print('handle last name $value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Hamburger(),
      appBar: PageHeader(header: 'My Profile'),
      body: SafeArea(
        child: Container(
            child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/male-512.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: EmailTextField(
                                  hint: 'First name',
                                  handleEmailChange: handleFirstName),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Expanded(
                                child: EmailTextField(
                              hint: 'Last name',
                              handleEmailChange: handleLastName,
                            )),
                          ],
                        ),
                      ),
                      DisabledTextField(hint: 'elon@gmail.com')
                    ],
                  ),
                ),
              )
            ],
          ),
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
