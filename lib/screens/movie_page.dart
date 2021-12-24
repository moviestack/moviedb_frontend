import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MoviePage extends StatefulWidget {
  Map<String, dynamic> data;

  MoviePage({Key? key, required this.data}) : super(key: key);
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height / 18),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    widget.data['poster_url'],
                    fit: BoxFit.cover,
                    width: width,
                    height: height / 2,
                  ),
                  ClipRRect(
                    // Clip it cleanly.
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.grey.withOpacity(0.6),
                        width: width,
                        height: height / 2,
                        alignment: Alignment.center,
                        child: Hero(
                          tag: widget.data['poster_url'],
                          child: Image.network(
                            widget.data['poster_url'],
                            width: 300,
                            height: 500,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/pp,840x830-pad,1000x1000,f8f8f8.u2.jpg',
                                width: 500,
                                height: 500,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.data['title'],
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.black,
                    )
                  ]),
              width: MediaQuery.of(context).size.width / 1.1,
              height: 300,
              child: Center(child: Text(widget.data.toString())),
            ),
          ],
        ),
      ),
    );
  }
}
