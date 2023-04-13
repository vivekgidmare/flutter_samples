import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class TappingIcon extends StatelessWidget {
  const TappingIcon(
      {required String this.title,
      required String this.value,
      required this.onLeftPressed,
      required this.onRightPressed});
  final String title;
  final String value;
  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: labelTextStyle,
        ),
        Text(
          value,
          style: bigLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedIconButton(
              iconData: FontAwesomeIcons.minus,
              onPress: onLeftPressed,
            ),
            SizedBox(width: 16.0),
            RoundedIconButton(
              iconData: FontAwesomeIcons.plus,
              onPress: onRightPressed,
            )
          ],
        )
      ],
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({IconData? this.iconData, VoidCallback? this.onPress});
  final IconData? iconData;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPress,
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
