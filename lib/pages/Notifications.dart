import 'package:flutter/material.dart';

// components
import 'package:e_commerce/components/InAppHeader.dart';

//utils
import 'package:e_commerce/utils/stringConstants.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InAppHeader(
        label: NOTIFICATIONS,
      ),
    );
  }
}
