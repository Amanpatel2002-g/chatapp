import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  getUsersByUserNmae(String username) {}
  static uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }
}
