import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  static getUsersByUserName(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }


  static getUsersByUserEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
  }

  static uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }

  static createChatRoom(String chatroomId, chatRoomMap) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatroomId)
        .set(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}
