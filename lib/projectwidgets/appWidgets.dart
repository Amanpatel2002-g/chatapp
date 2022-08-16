import 'package:flutter/material.dart';

dynamic appBarMain(BuildContext context) {
  return AppBar(
    title: Image.asset(
      'assets/images/logo.png',
      height: 40,
    ),
  );
}

dynamic textFieldInputDecoration(String hint) {
  return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white54),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white)));
}

dynamic simpleTextStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 17,
  );
}
dynamic mediumTextStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 17,
  );
}
