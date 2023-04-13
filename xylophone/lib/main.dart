import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void plaSound(int soundNumber) {
    final player = AudioPlayer();
    player.audioCache = AudioCache();
    player.play(AssetSource("note$soundNumber.wav"));
  }

  Widget buildKeys({required Color color, required int sound}) {
    return Expanded(
      child: TextButton(
        style: flat.copyWith(backgroundColor: MaterialStatePropertyAll(color)),
        onPressed: () {
          plaSound(sound);
        },
        child: const Text(""),
      ),
    );
  }

  final ButtonStyle flat = TextButton.styleFrom(
      // padding: const EdgeInsets.all(16.0),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKeys(color: Colors.red, sound: 1),
            buildKeys(color: Colors.orange, sound: 2),
            buildKeys(color: Colors.yellow, sound: 3),
            buildKeys(color: Colors.green, sound: 4),
            buildKeys(color: Colors.teal, sound: 5),
            buildKeys(color: Colors.blue, sound: 6),
            buildKeys(color: Colors.purple, sound: 7),
          ],
        ),
      ),
    );
  }
}
