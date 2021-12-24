import 'package:flutter/material.dart';
import 'package:moviedb/screens/home_page.dart';
import 'package:moviedb/screens/login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'prodSans', brightness: Brightness.dark),
      routes: {
        '/login': (context) => const LogIn(),
        '/home_page': (context) => const HomePage(),
      },
      home: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LogIn();
  }
}
