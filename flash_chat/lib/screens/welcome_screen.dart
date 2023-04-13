import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/todaProvider/todo_screen.dart';
import 'package:flash_chat/screens/todey/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "/";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    initializeFirebase();
    // createTweenAnimation();
    createCurvedAnimation();
  }

  void initializeFirebase() async {
    await Firebase.initializeApp();
  }

  void createTweenAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = ColorTween(begin: Colors.red, end: Colors.blue)
        .animate(animationController);
    animationController.forward();
    animation.addStatusListener((status) {
      // print(status);
      if (status == AnimationStatus.completed) {
        //Forward animation finished
        animationController.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        //reverse animation finished
        animationController.forward();
      }
    });
    animationController.addListener(() {
      // print(animation.value);
      setState(() {});
    });
  }

  void createCurvedAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animationController.forward();
    animation.addStatusListener((status) {
      // print(status);
      if (status == AnimationStatus.completed) {
        //Forward animation finished
        animationController.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        //reverse animation finished
        animationController.forward();
      }
    });
    animationController.addListener(() {
      // print(animation.value);
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: animation.value,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                // 0.1,
                // 0.4,
                // 0.6,
                // 0.9,
                animation.value * 0.1,
                animation.value * 0.4,
                animation.value * 0.6,
                animation.value * 0.9,
              ],
              colors: [
                Colors.yellow,
                Colors.red,
                Colors.indigo,
                Colors.teal,
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: "logo",
                    child: Container(
                      child: Opacity(
                        opacity: 1.0,
                        child: Image.asset(
                          'images/logo.png',
                        ),
                      ),
                      height: 60.0, //For tween animation
                      // height: animation.value * 75, // For curved animation
                    ),
                  ),
                  DefaultTextStyle(
                    child: AnimatedTextKit(
                      animatedTexts: [TypewriterAnimatedText('Flash Chat')],
                    ),
                    style: TextStyle(
                      fontSize: 45.0,
                      color: Colors.teal,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton("Log In", Colors.lightBlueAccent, () {
                Navigator.pushNamed(context, LoginScreen.id);
              }),
              RoundedButton("Register", Colors.blueAccent, () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              }),
              RoundedButton("Todo", Colors.blueAccent, () {
                Navigator.pushNamed(context, ToDoScreen.id);
              }),
              RoundedButton("Todo V2", Colors.blueAccent, () {
                Navigator.pushNamed(context, ToDoScreenV2.id);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
