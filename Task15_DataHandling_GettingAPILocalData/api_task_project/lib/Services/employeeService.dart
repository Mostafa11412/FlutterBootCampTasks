import 'dart:convert';

import 'package:api_task_project/DataModel/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class UserService {
  //please note that i used dummy api for users because provided emoloyee api link wasnt working.

  //api end point
  String endPoint = "https://dummyjson.com/users";

  Future<List<UserModel>> getUsers() async {
    //lit of users which will be returned.
    List<UserModel> users = [];
    //using try-catch to handle errors.
    try {
      //using https.get to call for data from api.
      var response = await https.get(Uri.parse(endPoint));
      //decode string response body to json and store it into list of map jsons.
      List<dynamic> data = jsonDecode(response.body)['users'];
      //iterate on data list using map to convert all data list to user model using fromjson method and store result list into users list.
      users = data
          .map(
            (e) => UserModel.fromJson(e),
          )
          .toList();
    } catch (e) {
      //if there is error catched print it.
      debugPrint("=====================================");
      debugPrint("error  " + e.toString());
      debugPrint("=====================================");
    }
//return users list.
    return users;
  }
}
