import 'package:flutter/material.dart';

//utils
import 'package:e_commerce/utils/constants.dart';

class GuestOnboardHeader extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              alignment: Alignment.center,
              color: kBasicTextColor,
              iconSize: 30.0,
            ),
          );
        },
      ),
      backgroundColor: kBasicOrange,
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
