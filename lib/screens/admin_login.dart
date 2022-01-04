import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:moviedb/constants/input_decoration.dart';
import 'package:moviedb/services/database.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController _titleController = TextEditingController();
    TextEditingController _plotController = TextEditingController();
    TextEditingController _yearController = TextEditingController();
    TextEditingController _durationController = TextEditingController();
    TextEditingController _urlController = TextEditingController();
    TextEditingController _countryController = TextEditingController();
    TextEditingController _productionController = TextEditingController();
    TextEditingController _boxOfficeController = TextEditingController();
    TextEditingController _awardsController = TextEditingController();
    TextEditingController _languageController = TextEditingController();
    TextEditingController _genreController = TextEditingController();
    TextEditingController _directorController = TextEditingController();
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
                          controller: _titleController,
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
                          controller: _plotController,
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
                          controller: _yearController,
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
                          controller: _durationController,
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
                          controller: _urlController,
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
                          controller: _countryController,
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
                          controller: _productionController,
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
                          controller: _boxOfficeController,
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
                          controller: _awardsController,
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
                          controller: _languageController,
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
                          controller: _genreController,
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
                          controller: _directorController,
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
                  ],
                ),
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: MaterialButton(
                minWidth: 200,
                height: 50,
                color: Colors.red,
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    final resp = await Database().addMovie(
                        _titleController.text,
                        _plotController.text,
                        _yearController.text,
                        _durationController.text,
                        _urlController.text,
                        _countryController.text,
                        _productionController.text,
                        _boxOfficeController.text,
                        _awardsController.text,
                        _languageController.text,
                        _genreController.text,
                        _directorController.text);

                    if (resp) {}
                  }
                },
                child: const Text('Submit'),
              ),
            )
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
