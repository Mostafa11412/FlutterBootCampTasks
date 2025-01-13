import 'dart:convert';

import 'package:api_task2/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //please note that i used dummy api for users because provided emoloyee api link wasnt working.

  //api end point
  String endPoint = "https://jsonplaceholder.typicode.com/users";

  Future<void> fetchUsers() async {
    //using try-catch to handle errors.
    try {
      //using dio to call for data from api.
      var response = await Dio().get(endPoint);

      //store response data in list of jsons.
      List<dynamic> data = response.data;

      //store users data locally using shared prefrences.
      SharedPreferences shared = await SharedPreferences.getInstance();
      //convert data json to string using json encode.
      String usersCashedData = jsonEncode(data);
      shared.setString("usersCashedData", usersCashedData);
    } catch (e) {
      //if there is error catched print it.
      debugPrint("=====================================");
      debugPrint("error  " + e.toString());
      debugPrint("=====================================");
    }
  }

  Future<List<UserModel>> getCashedUsers() async {
    //lit of users which will be returned.
    List<UserModel> users = [];

    //collect users data locally using shared prefrences.
    SharedPreferences shared = await SharedPreferences.getInstance();
    String cashedData = shared.getString('usersCashedData') ?? "";

    //convert back data string to json.
    List<dynamic> data = jsonDecode(cashedData);

    //iterate on data list using map to convert all data list to user model using fromjson method and store result list into users list.
    users = data
        .map(
          (e) => UserModel.fromJson(e),
        )
        .toList();

    return users;
  }
}
