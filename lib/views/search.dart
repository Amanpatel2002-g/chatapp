import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../projectwidgets/appWidgets.dart';
import '../services/database.dart';

// ignore: avoid_unnecessary_containers
class Search_Page extends StatefulWidget {
  @override
  _Search_PageState createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  TextEditingController Search_PageEditingController = TextEditingController();
  // ignore: non_constant_identifier_names
  late QuerySnapshot<Map<String, dynamic>> Search_PageResultSnapshot;

  bool isLoading = false;
  // ignore: non_constant_identifier_names
  bool haveUserSearch_Pageed = false;

  // ignore: non_constant_identifier_names
  initiateSearch_Page() async {
    if (Search_PageEditingController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      await DataBaseMethods.getUsersByUserNmae(Search_PageEditingController.text)
          .then((snapshot) {
        Search_PageResultSnapshot = snapshot;
        print("Here we are printing the few things");
        print(Search_PageResultSnapshot.docs[0].data()["userName"]);
        print(Search_PageResultSnapshot.docs[0].data()["email"]);
        // print("$Search_PageResultSnapshot");
        setState(() {
          isLoading = false;
          haveUserSearch_Pageed = true;
        });
      });
    }
  }

  Widget userList() {
    return haveUserSearch_Pageed
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: Search_PageResultSnapshot.docs.length,
            itemBuilder: (context, index) {
              return userTile(
                // ignore: avoid_print
                Search_PageResultSnapshot.docs[index].data()["name"],
                Search_PageResultSnapshot.docs[index].data()["email"],
              );
            })
        : Container();
  }

  /// 1.create a chatroom, send user to the chatroom, other userdetails

  Widget userTile(String userName, String userEmail) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                userEmail,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(24)),
              child: const Text(
                "Message",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleTextStyle(),
      body: isLoading
          ? Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    color: const Color(0x54FFFFFF),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: Search_PageEditingController,
                            style: simpleTextStyle(),
                            decoration: const InputDecoration(
                                hintText: "Search_Page username ...",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            initiateSearch_Page();
                          },
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0x36FFFFFF),
                                        Color(0x0FFFFFFF),
                                      ],
                                      begin: FractionalOffset.topLeft,
                                      end: FractionalOffset.bottomRight),
                                  borderRadius: BorderRadius.circular(40)),
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                "assets/images/search_white.png",
                                height: 25,
                                width: 25,
                              )),
                        )
                      ],
                    ),
                  ),
                  userList()
                ],
              ),
            ),
    );
  }
}
