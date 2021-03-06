import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

// ignore: must_be_immutable
class BasicButton extends StatelessWidget {
  BasicButton({@required this.name, @required this.handleOnPress});
  String name;
  Function handleOnPress;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: kBasicTextColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 13.0),
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.w500),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      onPressed: () {
        handleOnPress();
      },
      elevation: 10.0,
    );
  }
}
