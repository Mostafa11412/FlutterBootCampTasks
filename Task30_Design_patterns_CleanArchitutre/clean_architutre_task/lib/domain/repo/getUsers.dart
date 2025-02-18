import 'package:clean_architutre_task/data/dataSource/users_Dao.dart';
import 'package:clean_architutre_task/data/model/user_model.dart';
import 'package:clean_architutre_task/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class UsersRepo {
  UsersDao usersDao;

  @factoryMethod
  UsersRepo(this.usersDao);

  Future<List<UserEntity>> getUsers() async {
    List<UserEntity> usersEntities = [];
    try {
      List<UserModel> usersModel = await usersDao.getUsers();
      usersEntities = usersModel
          .map(
            (e) => e.toEntity(),
          )
          .toList();
    } catch (e) {
      debugPrint(e.toString());
    }
    return usersEntities;
  }
}
