import 'package:flutter/material.dart';
import 'package:moviedb/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/login': (context) => App(),
        '/home_page': (context) => HomePage(),
      },
      home: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Login',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: const [],
              ),
            ),
            const SizedBox(
              height: 600,
            ),
            Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home_page');
                },
                child: const Text('Button'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
