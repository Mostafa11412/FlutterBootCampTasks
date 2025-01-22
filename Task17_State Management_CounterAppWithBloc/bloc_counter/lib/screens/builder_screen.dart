import 'package:bloc_counter/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuilderScreen extends StatelessWidget {
  const BuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Themebutton()],
        title: const Text('Using Bloc Builder only'),
      ),
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocBuilder rebuilds the ui whenever the state changes
            BlocBuilder<CounterBloc, int>(
              builder: (context, state) {
                return Text(
                  "$state",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge, // Display the current counter value
                );
              },
            ),
            // Button to increment the counter by calling counter event
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(CounterIncrement());
              },
              child: Text(
                "Increment Counter",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
