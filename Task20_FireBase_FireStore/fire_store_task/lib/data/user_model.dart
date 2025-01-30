// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  int age;
  String hobby;

  UserModel({
    required this.name,
    required this.age,
    required this.hobby,
  });
  factory UserModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return UserModel(
        name: data['name'], age: data['age'], hobby: data['hobby']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "age": age,
      "hobby": hobby,
    };
  }
}
