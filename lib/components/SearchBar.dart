import 'package:flutter/material.dart';

// utils
import 'package:e_commerce/utils/constants.dart';
import 'package:avatar_glow/avatar_glow.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  SearchBar({
    @required this.speechToText,
    @required this.isListening,
  });
  Function speechToText;
  bool isListening = true;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: kBasicTextColor,
        );
      }),
      title: TextField(
        cursorColor: kBasicTextColor,
        decoration: InputDecoration(
          hintText: 'Enter your search',
          border: InputBorder.none,
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        AvatarGlow(
          animate: isListening,
          glowColor: Theme.of(context).primaryColor,
          endRadius: 75.0,
          duration: const Duration(microseconds: 2000),
          repeatPauseDuration: const Duration(microseconds: 100),
          repeat: true,
          child: IconButton(
            icon: Icon(
              Icons.mic,
              color: kBasicTextColor,
            ),
            onPressed: () {
              speechToText();
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
