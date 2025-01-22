import 'package:bloc_counter/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListenerScreen extends StatefulWidget {
  const ListenerScreen({super.key});

  @override
  State<ListenerScreen> createState() => _ListenerScreenState();
}

class _ListenerScreenState extends State<ListenerScreen> {
  int count = 0; // initialize count variable to display ui changes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Themebutton()],
        title: const Text('Using Bloc Listener only'),
      ),
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocListener listens for state changes
            BlocListener<CounterBloc, int>(
              listener: (context, state) {
                setState(() {
                  count = state;
                });
                // Show a snackbar when the counter reaches 10
                if (state == 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Counter is 10.")),
                  );
                }
              },
              child: Text(
                "$count",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge, // Display the current counter value
              ),
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
