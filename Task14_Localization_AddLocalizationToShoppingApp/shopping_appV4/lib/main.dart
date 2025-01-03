import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/signUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  runApp(
    //setup easyLocalization package for project with english and arabic locals.
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
        path: 'lang',
        fallbackLocale: const Locale('ar', 'EG'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //required configuration for easy localization tool
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleTextStyle: Theme.of(context)
                .textTheme
                .titleLarge, // using custom style initialized in main.
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          )),
      home: const SignUp(),
    );
  }
}
