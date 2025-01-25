import 'package:cubit_task/Cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Consumercounter extends StatelessWidget {
  const Consumercounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumer Counter"),
      ),
      body: Center(
        child: BlocConsumer<CounterCubit, int>(
          builder: (context, state) {
            return Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.toString()),
                Row(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().increnment();
                        },
                        child: Text("Increment")),
                    ElevatedButton(
                        onPressed: () {
                          context.read<CounterCubit>().decrement();
                        },
                        child: Text("Decrement"))
                  ],
                ),
              ],
            );
          },
          listener: (context, state) {
            if (state == 10) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Counter Reached 10")));
            }
            if (state == -10) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Counter Reached -10")));
            }
          },
        ),
      ),
    );
  }
}
