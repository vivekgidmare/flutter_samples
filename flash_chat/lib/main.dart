import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/models/TaskData.dart';
import 'package:flash_chat/screens/todaProvider/todo_screen.dart';
import 'package:flash_chat/screens/todey/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  late User? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black54),
          ),
        ),
        initialRoute: getInitialRoute(),
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          ToDoScreen.id: (context) => ToDoScreen(),
          ToDoScreenV2.id: (context) => ToDoScreenV2(),
        },
      ),
    );
  }

  void initializeFirebase() async {
    await Firebase.initializeApp();
  }

  void getLoggedInUser() async {
    final auth = FirebaseAuth.instance;
    loggedInUser = await auth.currentUser;
  }

  String getInitialRoute() {
    /* initializeFirebase();

    getLoggedInUser();
    print("getInitialRoute:${loggedInUser}");
    if (loggedInUser != null) {
      return WelcomeScreen.id;
    }*/
    return WelcomeScreen.id;
  }
}
