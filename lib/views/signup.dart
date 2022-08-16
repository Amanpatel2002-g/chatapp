// ignore_for_file: unnecessary_new

import 'package:chatapp/projectwidgets/appWidgets.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/views/chatroomsscreen.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();

  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextNameTextEditingController =
      TextEditingController();
  TextEditingController passwordTextNameTextEditingController =
      TextEditingController();
  final formkey = GlobalKey<FormState>();

  signMeUp() {
    if (formkey.currentState!.validate()) {
      setState() {
        isLoading = true;
      }

      authMethods
          .signUpWithEmailAndPassWord(emailTextNameTextEditingController.text,
              passwordTextNameTextEditingController.text)
          .then((value) {
        // print("${value.userId}");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ChatRoom()));
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
                          validator: (value) {
                            return value!.isEmpty || value.length < 2
                                ? "Please provide username greater than length 2"
                                : null;
                          },
                          controller: userNameTextEditingController,
                          style: simpleTextStyle(),
                          decoration: textFieldInputDecoration("Username")),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                          validator: (value) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value!)
                                ? null
                                : "Please enter the valid email";
                          },
                          controller: emailTextNameTextEditingController,
                          style: simpleTextStyle(),
                          decoration: textFieldInputDecoration("Email")),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                          validator: (value) {
                            return value!.length > 6
                                ? null
                                : "Please provide a valid  password";
                          },
                          controller: passwordTextNameTextEditingController,
                          style: simpleTextStyle(),
                          decoration: textFieldInputDecoration("PassWord")),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
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
                          signMeUp();
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
                          child: const Text("Sign Up",
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
                        child: const Text("Sign Up with google",
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
                            "Already have an account?",
                            style: mediumTextStyle(),
                          ),
                          const Text(
                            "Sign In Now",
                            style: TextStyle(
                              color: Color.fromARGB(255, 202, 22, 22),
                              fontSize: 17,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
