import 'package:bmi/calculator_brain.dart';
import 'package:bmi/screens/result_page.dart';
import 'package:bmi/components/tapping_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi/components/resusable_card.dart';
import 'package:bmi/components/icon_content.dart';
import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 21;
  void navigateToResultPage(String bmi, String result, String interpretation) {
    if (false) {
      Navigator.pushNamed(context, Routes.result.value);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ResultPage(
              result: result,
              bmi: bmi,
              interpretation: interpretation,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cards(
                    color: selectedGender == Gender.male
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: const IconContentWidget(
                      title: "MALE",
                      icon: FontAwesomeIcons.mars,
                    ),
                    onCardTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Cards(
                    color: selectedGender == Gender.female
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: const IconContentWidget(
                      title: "FEMALE",
                      icon: FontAwesomeIcons.venus,
                    ),
                    onCardTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Cards(
              color: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: bigLabelTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: sliderInActiveColor,
                      thumbColor: sliderActiveColor,
                      overlayColor: sliderActiveOverlayColor,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 16.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 32.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        print("Value Changed To$newValue");
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
              onCardTap: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Cards(
                    color: activeCardColour,
                    cardChild: TappingIcon(
                      title: "WEIGHT",
                      value: weight.toString(),
                      onLeftPressed: () {
                        setState(() {
                          weight--;
                        });
                      },
                      onRightPressed: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Cards(
                    color: activeCardColour,
                    cardChild: TappingIcon(
                      title: "AGE",
                      value: age.toString(),
                      onLeftPressed: () {
                        setState(() {
                          age--;
                        });
                      },
                      onRightPressed: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: "CALCULATE",
            onTap: () {
              CalculatorBrain brain =
                  CalculatorBrain(weight: weight, height: height);
              String bmi = brain.calculateBMI();
              String result = brain.getResult();
              String interpretation = brain.getInterpretation();
              navigateToResultPage(bmi, result, interpretation);
            },
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
