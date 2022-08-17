import 'package:chatapp/projectwidgets/appWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
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
                Container(
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
              ],
            ),
          )
        ]),
      ),
    );
  }
}
