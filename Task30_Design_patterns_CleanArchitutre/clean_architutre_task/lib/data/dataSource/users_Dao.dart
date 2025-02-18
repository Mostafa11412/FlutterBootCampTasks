import 'package:clean_architutre_task/core/api/api_manager.dart';
import 'package:clean_architutre_task/core/utils/constants.dart';
import 'package:clean_architutre_task/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class UsersDao {
  ApiManager apiManager;

  @factoryMethod
  UsersDao(this.apiManager);

  Future<List<UserModel>> getUsers() async {
    List<UserModel> users = [];
    try {
      var response = await apiManager.getData(AppConstants.endPoint);
      users = (response.data as List)
          .map((user) => UserModel.fromJson(user))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
    }
    return users;
  }
}
