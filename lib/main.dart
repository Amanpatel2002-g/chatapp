import 'package:chatapp/helper/helper.dart';
import 'package:chatapp/helper/helperFunctions.dart';
import 'package:chatapp/views/chatroomsscreen.dart';
import 'package:chatapp/views/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool islogedin = false;
  @override
  void initState() {
    // TODO: implement initState
    isuserloggedin();
    super.initState();
  }

  isuserloggedin() async {
    setState(() async {
    islogedin = (await helperFunctions.getUserLoggedInSharedPreference())!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xff145C9E),
          scaffoldBackgroundColor: const Color(0xff1F1F1F),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: islogedin? const ChatRoom(): const Authenticate(),
    );
  }
}
