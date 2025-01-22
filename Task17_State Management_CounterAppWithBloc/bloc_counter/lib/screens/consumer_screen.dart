import 'package:bloc_counter/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsumerScreen extends StatelessWidget {
  const ConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Themebutton()],
        title: const Text('Using Bloc Consumer'),
      ),
      body: Center(
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // BlocConsumer combines both BlocBuilder and BlocListener
            BlocConsumer<CounterBloc, int>(
              listener: (context, state) {
                // Show a snackbar when the counter reaches 10
                if (state == 10) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Counter is 10.",
                      ),
                    ),
                  );
                }
              },
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
