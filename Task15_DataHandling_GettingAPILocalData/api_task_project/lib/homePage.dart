import 'package:api_task_project/DataModel/user_model.dart';
import 'package:api_task_project/Services/employeeService.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//please note that i used dummy api for users because provided emoloyee api link wasnt working.
class _HomePageState extends State<HomePage> {
  // list of user model to store users in it.
  List<UserModel>? users;
  // boolean loading to check if data fetched or still in loading phase.
  bool loading = true;

//fetchUsers functions to call getUsers method and store users result in users list.
//and set loading to false to end loading phase.
  void fetchUsers() async {
    users = await UserService().getUsers();
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Api Task'),
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      ),
      //check users list if null display button to call function if not display users data in list view builder.
      body: users != null
          //if users data still fetching then display loading widget.
          ? loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: users!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        users![index].lastName!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      subtitle: Text(
                        "Age: ${users![index].age!}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      trailing: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    );
                  },
                )
          : Center(
              child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, fixedSize: Size(300, 100)),
              onPressed: () {
                fetchUsers();
              },
              child: Text("Fetch Users",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white, fontSize: 35)),
            )),
    );
  }
}
