import 'package:cubit_task/Cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListenerBuilderScreen extends StatelessWidget {
  const ListenerBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liustener Builder Screen"),
      ),
      body: Center(
          child: BlocListener<CounterCubit, int>(
        listener: (context, state) {
          if (state < 0) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Counter is Negative")));
          }
        },
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text(state.toString());
              },
            ),
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
        ),
      )),
    );
  }
}
