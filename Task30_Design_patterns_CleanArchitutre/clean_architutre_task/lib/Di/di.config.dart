// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../data/dataSource/users_Dao.dart' as _i399;
import '../domain/repo/getUsers.dart' as _i839;
import '../view/home/cubit/user_cubit.dart' as _i731;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i399.UsersDao>(() => _i399.UsersDao(gh<_i108.ApiManager>()));
    gh.factory<_i839.UsersRepo>(() => _i839.UsersRepo(gh<_i399.UsersDao>()));
    gh.factory<_i731.UserCubit>(() => _i731.UserCubit(gh<_i839.UsersRepo>()));
    return this;
  }
}
