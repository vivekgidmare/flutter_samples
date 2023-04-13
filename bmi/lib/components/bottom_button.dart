import 'package:flutter/material.dart';

import 'package:bmi/constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.title, required this.onTap});
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: largeButtonTextStyle,
        ),
        color: bottomContainerColor,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 16.0),
        padding: EdgeInsets.only(bottom: 8.0), //IOS may be
        height: bottomCardHeight,
      ),
    );
  }
}
