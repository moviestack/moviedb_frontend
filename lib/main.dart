import 'package:flutter/material.dart';
import 'package:moviedb/screens/admin_login.dart';
import 'package:moviedb/screens/home_page.dart';
import 'package:moviedb/screens/login.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage().initStorage;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'geomet', brightness: Brightness.light),
      routes: {
        '/login': (context) => const LogIn(),
        '/home_page': (context) => const HomePage(),
        '/adminLogin': (context) => const AdminLogin(),
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
