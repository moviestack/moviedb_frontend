import 'package:flutter/material.dart';
import 'package:moviedb/services/user.dart';
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
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: PreferredSize(
        child: const SizedBox(
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 40, fontFamily: 'geomet'),
            ),
          ),
        ),
        preferredSize: Size(width, 80),
      ),
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
                        cursorColor: Colors.red,
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
                          cursorColor: Colors.red,
                          decoration: inputDecoration.copyWith(
                            labelText: 'Password',
                          ),
                        )),
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
                    color: Colors.red,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      minWidth: 480,
                      height: 42,
                      onPressed: () async {
                        var resp = await _auth.register(
                            _usernameController.text, _passwordController.text);
                        if (resp['status'] == 200) {
                          User().setUname = _usernameController.text;
                          Navigator.pushReplacementNamed(context, '/home_page');
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
                        style: TextStyle(fontSize: 12, fontFamily: 'geomet'),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.red,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    clipBehavior: Clip.antiAlias,
                    child: MaterialButton(
                      minWidth: 120,
                      height: 42,
                      onPressed: () async {
                        //login logic needs to be implemented8
                        if (_key.currentState!.validate()) {
                          var resp = await _auth.login(_usernameController.text,
                              _passwordController.text);
                          if (resp['status'] == 200) {
                            User().setUname = _usernameController.text;
                            Navigator.pushReplacementNamed(
                                context, '/home_page');
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
                        style: TextStyle(fontSize: 12, fontFamily: 'geomet'),
                      ),
                    ),
                  ),
                  /* MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home_page');
                  },
                  child: const Text(
                    'Bypass',
                  ),
                ), */

                  Card(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/adminLogin');
                      },
                      child: Text('Admin login bypass'),
                    ),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: width / 1.2, top: 180),
                child: Text(
                  'MovieDB.',
                  style: TextStyle(
                    fontSize: 38,
                    color: Colors.red,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
