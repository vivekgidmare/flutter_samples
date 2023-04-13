import 'package:bmi/screens/input_page.dart';
import 'package:bmi/screens/result_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: sliderInActiveColor,
            thumbColor: sliderActiveColor,
            overlayColor: sliderActiveOverlayColor,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0)),
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      // home: SafeArea(child: const InputPage(title: 'BMI Calculator')),
      initialRoute: "/",
      routes: {
        Routes.home.value: (context) => InputPage(title: "BMI Calculator"),
        Routes.result.value: (context) => ResultPage(
              result: '',
              bmi: '',
              interpretation: '',
            )
      },
    );
  }
}
