import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moviedb/services/user.dart';
import '../constants/input_decoration.dart';
import 'package:get/get.dart';
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
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
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
                    height: 50,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: SizedBox(
                        width: 620,
                        child: TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Password is required'),
                            MinLengthValidator(6,
                                errorText:
                                    'Password must have at least 6 characters'),
                          ]),
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
              height: 128,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                            colors: [Colors.red, Colors.pink],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight),
                      ),
                      child: MaterialButton(
                        height: 42,
                        minWidth: 280,
                   
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            var resp = await _auth.register(
                                _usernameController.text,
                                _passwordController.text);
                            if (resp['status'] == 200) {
                              box.write('uname', _usernameController.text);
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
                          'Create account',
                          style: TextStyle(fontSize: 12, fontFamily: 'geomet'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                            colors: [Colors.red, Colors.pink],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight),
                      ),
                      child: MaterialButton(
                        minWidth: 120,
                        height: 42,
                        onPressed: () async {
                        
                          if (_key.currentState!.validate()) {
                            
                            var resp = await _auth.login(
                                _usernameController.text,
                                _passwordController.text);
                            if (resp['status'] == 200) {
                              box.write('uname', _usernameController.text);
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: const LinearGradient(
                            colors: [Colors.red, Colors.pink],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight),
                      ),
                      child: MaterialButton(
                        minWidth: 200,
                        height: 42,
                        onPressed: () async {
                          if (_key.currentState!.validate()) {
                            var resp = await _auth.login(
                                'admin', _passwordController.text);
                            if (resp['status'] == 200) {
                              box.write('uname', _usernameController.text);
                              Navigator.pushNamed(context, '/admin_login');
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
                          'Admin login',
                          style: TextStyle(fontSize: 12, fontFamily: 'geomet'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: width / 1.2, top: 180),
                child: const Text(
                  'MovieDB.',
                  style: TextStyle(
                      fontSize: 38,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
