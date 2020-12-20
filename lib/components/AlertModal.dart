import 'package:flutter/material.dart';

class AlertModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('User already exists'),
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              'OK',
              style: Theme.of(context).textTheme.headline1,
            ))
      ],
    );
  }
}
