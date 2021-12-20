import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
