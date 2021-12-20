import 'package:flutter/material.dart';
import 'package:moviedb/screens/home_page.dart';
import 'package:moviedb/screens/login.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/login': (context) => LogIn(),
        '/home_page': (context) => HomePage(),
      },
      home: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LogIn();
  }
}
