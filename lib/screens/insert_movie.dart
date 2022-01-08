import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:moviedb/constants/input_decoration.dart';
import 'package:moviedb/services/database.dart';

class InsertMovie extends StatelessWidget {
  const InsertMovie({Key? key}) : super(key: key);

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
    TextEditingController _ratingController = TextEditingController();
    TextEditingController _reviewController = TextEditingController();
    final _key = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Insert movie',
            style: TextStyle(
                fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.red, Colors.pink],
                begin: Alignment.topLeft,
                end: Alignment.topRight),
          ),
        ),
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
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: SizedBox(
                        width: 600,
                        child: TextFormField(
                          controller: _ratingController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Rating required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie rating',
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
                          controller: _reviewController,
                          cursorColor: Colors.red,
                          validator: RequiredValidator(
                            errorText: 'Movie review is required',
                          ),
                          decoration: inputDecoration.copyWith(
                            labelText: 'Movie review',
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
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.red, Colors.pink],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight),
                ),
                child: MaterialButton(
                  minWidth: 200,
                  height: 50,
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      Database().addMovie(
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
                        _directorController.text,
                        _ratingController.text,
                        _reviewController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          elevation: 10,
                          backgroundColor: Colors.red,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          content: Text('Movie ' +
                              _titleController.text +
                              ' inserted to the database'),
                        ),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
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
