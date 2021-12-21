import 'package:flutter/material.dart';
import '../constants/input_decoration.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../services/auth.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _key = GlobalKey<FormState>();
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
          child: const SizedBox(
            child: Center(
              child: Text(
                'Login',
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
          preferredSize: Size(width, 80)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: SizedBox(
                      width: 600,
                      child: TextFormField(
                        controller: _usernameController,
                        validator: RequiredValidator(
                          errorText: 'Username is required',
                        ),
                        decoration: inputDecoration.copyWith(
                          labelText: 'Username',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: SizedBox(
                      width: 600,
                      child: TextFormField(
                        controller: _passwordController,
                        validator:
                            RequiredValidator(errorText: 'Password validator'),
                        decoration: inputDecoration.copyWith(
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.lightBlue,
                  elevation: 10,
                  child: MaterialButton(
                    minWidth: 80,
                    onPressed: () async {
                      //login logic needs to be implemented8
                      if (_key.currentState!.validate()) {
                        var resp = await _auth.login(
                            _usernameController.text, _passwordController.text);
                        if (resp['status'] == 200) {
                          Navigator.pushNamed(context, '/home_page');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                resp['error'],
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlue,
                  elevation: 10,
                  child: MaterialButton(
                    minWidth: 120,
                    onPressed: () async {
                      var resp = await _auth.register(
                          _usernameController.text, _passwordController.text);
                      if (resp['status'] == 200) {
                        Navigator.pushNamed(context, '/home_page');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              resp['error'],
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Create account',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
