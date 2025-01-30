// ignore_for_file: use_build_context_synchronously

import 'package:fire_store_task/cubit/users_cubit.dart';

import 'package:fire_store_task/view/users_page.dart';
import 'package:fire_store_task/widgets/customButton.dart';
import 'package:fire_store_task/widgets/customFormFeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputFormPage extends StatefulWidget {
  const InputFormPage({super.key});

  @override
  State<InputFormPage> createState() => _HomePageState();
}

class _HomePageState extends State<InputFormPage> {
  late TextEditingController nameC;
  late TextEditingController ageC;
  late TextEditingController hobbyC;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameC = TextEditingController();
    ageC = TextEditingController();
    hobbyC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameC.dispose();
    ageC.dispose();
    hobbyC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Input Form Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                CustomFormFeild(
                  title: "Name",
                  keyboardType: TextInputType.name,
                  controller: nameC,
                  validator: (_) {
                    if (nameC.text.isEmpty) {
                      return "Please Enter user Name.";
                    }
                    return null;
                  },
                ),
                CustomFormFeild(
                  title: "Age",
                  keyboardType: TextInputType.name,
                  controller: ageC,
                  validator: (_) {
                    if (ageC.text.isEmpty || int.tryParse(ageC.text) == null) {
                      return "Please Enter Valid user Age.";
                    }
                    return null;
                  },
                ),
                CustomFormFeild(
                  title: "Favorite Hobby",
                  keyboardType: TextInputType.name,
                  controller: hobbyC,
                  validator: (_) {
                    if (hobbyC.text.isEmpty) {
                      return "Please Enter user Hobby.";
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BlocConsumer<UsersCubit, UsersState>(
                      listener: (context, state) {
                        if (state is UsersSaved) {
                          nameC.clear();
                          ageC.clear();
                          hobbyC.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("User Saved Succefuly.")));
                        }
                        if (state is UsersSavingError) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Error Saving User. ${state.error}")));
                        }
                      },
                      builder: (context, state) {
                        if (state is UsersSaving) {
                          return CircularProgressIndicator();
                        }
                        return CustomButton(
                          buttonTitle: "Save Data",
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              context.read<UsersCubit>().saveUsers(nameC.text,
                                  hobbyC.text, int.parse(ageC.text));
                            }
                          },
                          buttonColor: Colors.blue,
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        );
                      },
                    ),
                    CustomButton(
                      buttonTitle: "View Data",
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UsersPage(),
                        ));
                      },
                      buttonColor: Colors.blue,
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
