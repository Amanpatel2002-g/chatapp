import 'package:chatapp/helper/helper.dart';
import 'package:chatapp/helper/helperFunctions.dart';
import 'package:chatapp/services/auth.dart';
import 'package:chatapp/views/search.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethods authMethods = new AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              helperFunctions.saveuserLoggedInSharedPreference(false);
              authMethods.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Authenticate()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(child: const Icon(Icons.exit_to_app)),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => Search_Page())));
        },
      ),
    );
  }
}
