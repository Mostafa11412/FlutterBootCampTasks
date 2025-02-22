// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'users_cubit.dart';

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UserModel> users;
  UsersLoaded({
    required this.users,
  });
}

class UsersLoadingError extends UsersState {
  final String error;
  UsersLoadingError({
    required this.error,
  });
}

class UsersSaving extends UsersState {}

class UsersSaved extends UsersState {}

class UsersSavingError extends UsersState {
  final String error;
  UsersSavingError({
    required this.error,
  });
}
