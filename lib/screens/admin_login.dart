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
                            errorText: 'Movie Plot is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie Plot',
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
                          controller: _movieTitleController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie Year is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie Year',
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
                          controller: _movieTitleController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie Duration is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie Duration',
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
                          controller: _movieTitleController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie URL is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie URL',
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
                          controller: _movieTitleController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie Country is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie Country',
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
                          controller: _movieTitleController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie Production is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie Production',
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
                          controller: _movieTitleController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie Box Office is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie Box Office',
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
                          controller: _movieTitleController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie Awards is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie Awards',
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
                          controller: _movieTitleController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie Language is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie Language',
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
                          controller: _movieTitleController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie Genre is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie Genre',
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
                          controller: _movieTitleController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie Director is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie Director',
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
