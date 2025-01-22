import 'package:bloc_counter/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_counter/screens/builder_screen.dart';
import 'package:bloc_counter/screens/consumer_screen.dart';
import 'package:bloc_counter/screens/listener_screen.dart';
import 'package:bloc_counter/themeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Themebutton()],
        title: const Text('Counter App With Bloc'),
      ),
      body: Center(
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Navigate to the ListenerScreen and provide a new instance of CounterBloc
            // to seperate each counter in each screen
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => CounterBloc(),
                    child: ListenerScreen(),
                  ),
                ));
              },
              child: Text("Bloc Listener Only"),
            ),
            // Navigate to the BuilderScreen and provide a new instance of CounterBloc
            // to seperate each counter in each screen
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => CounterBloc(),
                    child: BuilderScreen(),
                  ),
                ));
              },
              child: Text("Bloc Builder Only"),
            ),
            // Navigate to the ConsumerScreen and provide a new instance of CounterBloc
            // to seperate each counter in each screen
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => CounterBloc(),
                    child: ConsumerScreen(),
                  ),
                ));
              },
              child: Text("Bloc Consumer"),
            ),
          ],
        ),
      ),
    );
  }
}
