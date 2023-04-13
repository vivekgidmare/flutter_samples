import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF0258A6),
        title: const Text("Magic ball"),
      ),
      backgroundColor: Color(0xFF0258A6),
      body: const MagicBall(),
    ),
  ));
}

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  State<MagicBall> createState() => _MagicBallState();
}

int findRandomNUmber() {
  return Random().nextInt(5) + 1;
}

final ButtonStyle flat = TextButton.styleFrom(
  padding: const EdgeInsets.all(16.0),
  backgroundColor: const Color(0xFF0258A6),
);

class _MagicBallState extends State<MagicBall> {
  int counter = 1;

  void notifyState() {
    setState(() {
      counter = findRandomNUmber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          style: flat,
          onPressed: () {
            notifyState();
          },
          child: Image.asset('images/ball$counter.png')),
    );
  }
}
