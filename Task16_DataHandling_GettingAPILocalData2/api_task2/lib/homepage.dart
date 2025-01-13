import 'package:api_task2/userDetails.dart';
import 'package:api_task2/userServices.dart';
import 'package:api_task2/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of user model to store users in it.
  List<UserModel> users = [];

  // boolean loading to check if data fetched or still in loading phase.
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  getUsers() async {
    //call fetch users function to fetch users from api and store it locally using shared prefrences;
    await UserService().fetchUsers();

    //call get Cashed Users function to get users stored locally using shared prefrences and store returned data to users list.
    users = await UserService().getCashedUsers();
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Api Task"),
          centerTitle: true,
          titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        ),
        
        //if users data still fetching then display loading widget.
        body: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserDetails(user: users[index]),
                    )),
                    title: Text(
                      users[index].name!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 22),
                    ),
                    subtitle: Text(
                      "Age: ${users[index].email!}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 22),
                    ),
                    trailing: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  );
                },
              ));
  }
}
