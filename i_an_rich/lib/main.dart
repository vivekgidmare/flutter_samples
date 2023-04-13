import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Flutter App'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: const [
                Image(image: AssetImage('images/diamond.jpeg')),
                Image(
                    image: NetworkImage(
                        'https://img1.cgtrader.com/items/3579119/b0c7a67e96/large/flutter-dash-3d-model-animated-obj-fbx-stl-blend.jpg')),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
