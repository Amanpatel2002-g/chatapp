import 'package:chatapp/views/signin.dart';
import 'package:chatapp/views/signup.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showsignin = true;

  void toggleView() {
    // ignore: unused_element
    setState(() {
      showsignin = !showsignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showsignin) {
      return SignIn(toggleView);
    } else {
      return SignUp(toggleView);
    }
  }
}
