import 'dart:ui';

import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

class InAppHeader extends StatelessWidget implements PreferredSizeWidget {
  InAppHeader({@required this.label});
  String label;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: kBasicTextColor,
            iconSize: 30.0,
          );
        },
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text(
        label,
        style: TextStyle(
          color: kBasicTextColor,
          fontSize: 15.0,
          fontFamily: 'Comfortaa',
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
