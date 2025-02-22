import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_store_task/data/user_model.dart';

class FirebaseServices {
  static Future<void> saveUserToFs(UserModel user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc()
        .set(user.toFirestore());
  }

  static Future<List<UserModel>> fetchUsers() async {
    List<UserModel> users = [];

    await FirebaseFirestore.instance.collection('users').get().then(
      (querySnapshot) {
        for (var i in querySnapshot.docs) {
          users.add(UserModel.fromFireStore(i));
        }
      },
    );

    return users;
  }
}
