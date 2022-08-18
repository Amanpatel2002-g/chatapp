// ignore_for_file: unrelated_type_equality_checks

import 'package:chatapp/projectwidgets/appWidgets.dart';
import 'package:chatapp/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextEditingController = TextEditingController();
  late QuerySnapshot<Map<String, dynamic>> searchSnapShot;
  initStateSearch() {
    DataBaseMethods.getUsersByUserNmae(searchTextEditingController.text)
        .then((val) {
      setState(() {
        searchSnapShot = val;
      });
    });
  }

  // createChatroomAndStartConversation(String username, ) {
  //   List<String> users = [];
  //   DataBaseMethods.createChatRoom(chatroomId, chatRoomMap)
  // }

  Widget searchList() {
    return searchSnapShot != Null
        ? SizedBox(
            height: 29,
            child: ListView.builder(
                itemCount: searchSnapShot.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SearchTile(
                    userName: searchSnapShot.docs[index].data()["name"],
                    userEmail: searchSnapShot.docs[index].data()["email"],
                  );
                }),
          )
        : Container();
  }

  @override
  void initState() {
    // initStateSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(children: [
          Container(
            color: const Color(0x54FFFFFF),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                const Expanded(
                    child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "Search Username......",
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none),
                )),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0x36FFFFFF),
                          Color(0x0FFFFFFF),
                        ]),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Image.asset("assets/images/search_white.png")),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTile({required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: mediumTextStyle(),
              ),
              Text(
                userEmail,
                style: mediumTextStyle(),
              )
            ],
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Message",
                style: mediumTextStyle(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
