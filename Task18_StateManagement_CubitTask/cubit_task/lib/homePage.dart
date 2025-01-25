import 'package:cubit_task/Consumer/consumerCounter.dart';
import 'package:cubit_task/Cubit/counter_cubit.dart';
import 'package:cubit_task/ListenerAndBuilder/listener_builder_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomPage'),
      ),
      body: Center(
          child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                //create provider for each screen to sepereate two counters
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => CounterCubit(),
                    child: Consumercounter(),
                  ),
                ));
              },
              child: Text("Consumer Counter")),
          ElevatedButton(
              onPressed: () {
                //create provider for each screen to sepereate two counters

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => CounterCubit(),
                    child: ListenerBuilderScreen(),
                  ),
                ));
              },
              child: Text("Listener and Builder Counter"))
        ],
      )),
    );
  }
}
