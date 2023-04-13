import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/resusable_card.dart';
import 'package:bmi/screens/input_page.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.result, required this.bmi, required this.interpretation});
  final String result;
  final String bmi;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Cards(
                color: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      result,
                      style: titleTextStyle,
                    ),
                    Text(
                      bmi,
                      style: bigLabelTextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: labelTextStyle.copyWith(
                        color: Colors.white,
                        wordSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              title: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
