import 'package:fire_store_task/data/user_model.dart';
import 'package:fire_store_task/fireBase_Services/fireBase_Services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  //using cubit to manage saving and fetching users states.
  UsersCubit() : super(UsersInitial());

  fetchUsers() async {
    emit(UsersLoading());

    try {
      List<UserModel> users = await FirebaseServices.fetchUsers();
      emit(UsersLoaded(users: users));
    } catch (e) {
      emit(UsersLoadingError(error: e.toString()));
    }
  }

  saveUsers(String name, String hobby, int age) async {
    emit(UsersSaving());
    try {
      UserModel user = UserModel(name: name, age: age, hobby: hobby);
      await FirebaseServices.saveUserToFs(user);
      emit(UsersSaved());
    } catch (e) {
      emit(UsersSavingError(error: e.toString()));
    }
  }
}
