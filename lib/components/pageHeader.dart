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
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
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
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: kBasicTextColor,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
        SizedBox(
          width: 10.0,
        ),
        IconButton(
          icon: const Icon(
            Icons.notifications_none_outlined,
            color: kBasicTextColor,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/notifications');
          },
        ),
        SizedBox(
          width: 10.0,
        ),
        IconButton(
          icon: const Icon(
            Icons.shopping_bag_outlined,
            color: kBasicTextColor,
            size: 30.0,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/shoppingbag');
          },
        ),
        SizedBox(
          width: 10.0,
        ),
      ],
      backgroundColor: Colors.white,
      bottomOpacity: 0.0,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
