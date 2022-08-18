import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  static getUsersByUserNmae(String username) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .get();
  }

  static uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }

  static createChatRoom(String chatroomId, chatRoomMap) {
    FirebaseFirestore.instance.collection("chatroom").doc(chatroomId);
  }
}
