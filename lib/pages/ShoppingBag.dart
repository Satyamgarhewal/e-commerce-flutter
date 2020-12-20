import 'package:flutter/material.dart';

// components
import 'package:e_commerce/components/InAppHeader.dart';

//utils
import 'package:e_commerce/utils/stringConstants.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InAppHeader(
        label: SHOPPING_BAG,
      ),
    );
  }
}
