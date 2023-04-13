import 'package:flutter/material.dart';

import '../constants.dart';

class IconContentWidget extends StatelessWidget {
  const IconContentWidget({required this.title, required this.icon});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 16.0),
        Text(
          title,
          style: labelTextStyle,
        )
      ],
    );
  }
}
