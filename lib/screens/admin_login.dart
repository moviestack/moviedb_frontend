import 'dart:html';

import 'package:flutter/material.dart';
import 'package:moviedb/constants/input_decoration.dart';
import 'package:moviedb/services/database.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          height: 100,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: const Center(
            child: Text(
              'Admin portal',
              style: TextStyle(
                  fontSize: 34,
                  color: Colors.white.withAlpha(200),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    Navigator.pushNamed(context, '/insert_movie');
                  },
                  child: const Text(
                    'Insert Movie',
                    style: TextStyle(color: Colors.white),
                  ),
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
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                            title: const Center(
                              child: Text('Enter movie title',
                                  style: TextStyle(fontFamily: 'geomet')),
                            ),
                            actions: [
                              TextField(
                                  cursorColor: Colors.red,
                                  controller: _titleController,
                                  decoration: inputDecoration.copyWith(
                                      labelText: 'Title')),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Colors.red, Colors.pink],
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight),
                                  ),
                                  child: MaterialButton(
                                    child: const Text('Delete'),
                                    onPressed: () {
                                      Database()
                                          .deleteMovie(_titleController.text);
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          elevation: 10,
                                          backgroundColor: Colors.red,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20))),
                                          content: Text('Movie ' +
                                              _titleController.text +
                                              ' deleted from the database'),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  child: const Text(
                    'Delete Movie',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
