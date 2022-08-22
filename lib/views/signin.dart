// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatapp/helper/helperFunctions.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/services/database.dart';
import 'package:chatapp/views/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:chatapp/projectwidgets/appWidgets.dart';

import 'chatroomsscreen.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  // ignore: use_key_in_widget_constructors
  const SignIn(this.toggle);
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  late QuerySnapshot<Map<String, dynamic>> querySnapshot;
  signMeIN() {
    if (formkey.currentState!.validate()) {
      AuthMethods.signInWithEmail(
          emailTextEditingController.text, passwordTextEditingController.text);
      DataBaseMethods.getUsersByUserEmail(emailTextEditingController.text)
          .then((value) {
        helperFunctions
            .saveUserNameSharedPreference(querySnapshot.docs[0].data()["name"]);
      });
      AuthMethods.signUpWithEmailAndPassWord(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
        if (value != null) {
          helperFunctions.saveuserLoggedInSharedPreference(true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const ChatRoom())));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: emailTextEditingController,
                            validator: (value) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value!)
                                  ? null
                                  : "Please enter the valid email";
                            },
                            style: simpleTextStyle(),
                            decoration: textFieldInputDecoration("Email")),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                            controller: passwordTextEditingController,
                            validator: (value) {
                              return value!.length > 6
                                  ? null
                                  : "Please provide a valid  password";
                            },
                            style: simpleTextStyle(),
                            decoration: textFieldInputDecoration("PassWord")),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Forgot Password?",
                      style: simpleTextStyle(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    signMeIN();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0xff007EE4),
                          Color(0xff007EE4),
                        ]),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text("Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 255, 255, 255),
                      ]),
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text("Sign in with google",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 17,
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account?",
                      style: mediumTextStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.toggle();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                            color: Color.fromARGB(255, 202, 22, 22),
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
