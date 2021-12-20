import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: App()));
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
                onPressed: () {},
                child: const Text('Button'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
