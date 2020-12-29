import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EnterValidMessage extends StatelessWidget {
  EnterValidMessage({@required this.invalidMesage});
  String invalidMesage;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          invalidMesage,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.red,
            fontSize: 10.0,
          ),
        ),
      ),
      Container(
        width: double.infinity,
      )
    ]);
  }
}
