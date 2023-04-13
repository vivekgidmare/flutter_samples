import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.blue,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

final ButtonStyle flat = TextButton.styleFrom(
  padding: const EdgeInsets.all(16.0),
  backgroundColor: null,
);

int randomDice() {
  return Random().nextInt(6) + 1;
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void changeDiceNumber() {
    setState(() {
      leftDiceNumber = randomDice();
      rightDiceNumber = randomDice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            // flex: 2,
            child: TextButton(
              style: flat,
              onPressed: () {
                changeDiceNumber();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            // flex: 2,
            child: TextButton(
              style: flat,
              onPressed: () {
                changeDiceNumber();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
