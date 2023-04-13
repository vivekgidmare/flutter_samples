import 'package:flutter/material.dart';

void main() {
  runApp(const VisitingCardApp());
}

class VisitingCardApp extends StatelessWidget {
  const VisitingCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/avatar_brad_pitt.jpeg'),
              ),
              const Text(
                'Vivek Gidmare',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.tealAccent,
                  fontSize: 24.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.tealAccent,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                child: Row(
                  children: const [
                    SizedBox(
                      width: 16.0,
                      height: 48.0,
                    ),
                    Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 24.0,
                    ),
                    Text(
                      '+91 9090909090',
                      style: TextStyle(color: Colors.green, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.mail,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 24.0,
                      ),
                      Text(
                        '+91 vivekgidmare@gmail.com',
                        style: TextStyle(color: Colors.green, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.green,
                  ),
                  title: Text(
                    '+91 vivekgidmare@gmail.com',
                    style: TextStyle(color: Colors.green, fontSize: 16.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Challenge to reproduce layout
// https://drive.google.com/uc?export=download&id=1k7oW5qVLJqzw_lEFsOFS_qKmkGjBX1pL
class ChallengeApp extends StatelessWidget {
  const ChallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.0,
                color: Colors.red,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    color: Colors.green,
                  ),
                ],
              ),
              Container(
                width: 100.0,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCardApp extends StatelessWidget {
  const MyCardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /*appBar: AppBar(
          title: Text('My Card'),
        ),*/
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // verticalDirection: VerticalDirection.up,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                color: Colors.red,
                width: 100.0,
                height: 100.0,
                alignment: Alignment.centerRight,
                // margin: const EdgeInsets.all(16.0),
                // padding: const EdgeInsets.fromLTRB(10.0, 15.0, 40.0, 40.0),
                child: const Text('Container 1'),
              ),
              Container(
                width: 300.0,
                height: 100.0,
                color: Colors.green,
                alignment: Alignment.center,
                // margin: const EdgeInsets.all(16.0),
                // padding: const EdgeInsets.fromLTRB(10.0, 15.0, 40.0, 40.0),
                child: const Text('Container 2'),
              ),
              const SizedBox(
                width: 200.0,
              ),
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
                // margin: const EdgeInsets.all(16.0),
                // padding: const EdgeInsets.fromLTRB(10.0, 15.0, 40.0, 40.0),
                child: const Text('Container 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
