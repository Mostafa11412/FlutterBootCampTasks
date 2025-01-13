import 'package:api_task2/user_model.dart';
import 'package:flutter/material.dart';

//user details screen displays user details in a column using user model passed to it through navigation,
class UserDetails extends StatelessWidget {
  UserModel user;
  UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Name: ${user.name}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 22),
              ),
              Text(
                "Email Address: ${user.email}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 22),
              ),
              Text(
                "Phone Number: ${user.phone}",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
