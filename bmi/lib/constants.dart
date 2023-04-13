import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));
const titleTextStyle = TextStyle(fontSize: 25.0, color: Color(0xFF00FF00));
const bigLabelTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);
const largeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const bottomCardHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const sliderActiveColor = Color(0xFFEB1555);
const sliderInActiveColor = Color(0xFF8D8E98);
const sliderActiveOverlayColor = Color(0x29EB1555);

enum Routes {
  home("/"),
  result("/bmi_result");

  const Routes(this.value);
  final String value;
}

enum Gender {
  male,
  female;
}
