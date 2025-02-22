import 'package:fire_store_task/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //fetching users requarly without streaming data because saving user and
      //displaying users in difrrent screens.
      create: (context) => UsersCubit()..fetchUsers(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Users page'),
        ),
        body: BlocConsumer<UsersCubit, UsersState>(
          listener: (context, state) {
            if (state is UsersLoadingError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Error Loading Users. ${state.error}")));
            }
          },
          builder: (context, state) {
            if (state is UsersLoaded) {
              if (state.users.isEmpty) {
                return Center(
                  child: Text(
                    "There is no users saved yet.",
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }
              return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      state.users[index].name,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      "Hobby: ${state.users[index].hobby}",
                      style: TextStyle(fontSize: 20),
                    ),
                    trailing: Text(
                      "Age: ${state.users[index].age.toString()}",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
