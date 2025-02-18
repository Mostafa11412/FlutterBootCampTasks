import 'package:clean_architutre_task/Di/di.dart';
import 'package:clean_architutre_task/view/home/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserCubit>()..getUsers(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Clean Architeture Task'),
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserErrorState) {
              return Center(
                child: Center(
                  child: Text(state.error),
                ),
              );
            }
            if (state is UserLoadedState) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.usersEntites.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(state.usersEntites[index].name!),
                      subtitle: Text(state.usersEntites[index].email!),
                      trailing: Text(state.usersEntites[index].website!),
                    );
                  },
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
