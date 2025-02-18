import 'package:bloc/bloc.dart';
import 'package:clean_architutre_task/domain/entities/user_entity.dart';
import 'package:clean_architutre_task/domain/repo/getUsers.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  UsersRepo usersRepo;
  @factoryMethod
  UserCubit(this.usersRepo) : super(UserInitialState());

  Future<void> getUsers() async {
    emit(UserLoadingState());
    try {
      List<UserEntity> usersEntities = await usersRepo.getUsers();
      emit(UserLoadedState(usersEntities));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
