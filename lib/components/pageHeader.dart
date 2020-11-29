import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';

class PageHeader extends StatelessWidget implements PreferredSizeWidget {
  PageHeader({@required this.header});
  final String header;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 0, 0),
            child: IconButton(
              icon: const Icon(Icons.menu),
              color: kBasicTextColor,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          );
        },
      ),
      title: Padding(
        padding: EdgeInsets.fromLTRB(55.0, 20.0, 0, 0),
        child: Text(
          header,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kBasicTextColor,
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w900,
            fontSize: 30.0,
          ),
        ),
      ),
      backgroundColor: kBasicOrange,
      bottomOpacity: 0.0,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
