import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:moviedb/constants/input_decoration.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _movieTitleController = TextEditingController();
    final _key = GlobalKey<FormState>();
    return Scaffold(
      appBar: PreferredSize(
        child: const SizedBox(
          child: Center(
            child: Text(
              'Admin Page',
              style: TextStyle(fontSize: 40, fontFamily: 'geomet'),
            ),
          ),
        ),
        preferredSize: Size(size.width, 80),
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
              child: Center(
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _movieTitleController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie Title is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie Title',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    //add more fields here
                    //add controller for each textform field
                    // check the above code for reference
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),

            /* MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home_page');
                  },
                  child: const Text(
                    'Bypass',
                  ),
                ), */
          ],
        ),
      ),
    );
  }
}
