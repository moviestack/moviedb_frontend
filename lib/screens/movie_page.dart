import 'dart:ui';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:moviedb/screens/review_page.dart';
import 'package:moviedb/services/database.dart';

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
    double rating = 10;
    final box = GetStorage();
    return Scaffold(
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: Database().getAllData(widget.data['m_id'] as int),
              builder: (context, AsyncSnapshot<dynamic> snap) {
                if (snap.connectionState == ConnectionState.done) {
                  rating = snap.data['average_rating'];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //  SizedBox(height: height / 18),
                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              snap.data['poster_url'],
                              fit: BoxFit.cover,
                              width: width,
                              height: height,
                            ),
                            ClipRRect(
                              // Clip it cleanly.
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  width: width,
                                  height: height,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                        Colors.black.withOpacity(0.3),
                                        Colors.black.withOpacity(0.9),
                                      ])),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                            Positioned(
                              left: width / 20,
                              child: Hero(
                                tag: snap.data['poster_url'],
                                child: Card(
                                  elevation: 10,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image.network(
                                    snap.data['poster_url'],
                                    width: 340,
                                    height: 520,
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
                            Positioned(
                              top: 100,
                              left: width / 2.5,
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                      text: snap.data['title'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'geomet',
                                        fontSize: snap.data['title']
                                                    .toString()
                                                    .length >
                                                28
                                            ? 20
                                            : 40,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: '       |       ' +
                                              snap.data['duration'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 180,
                              left: width / 2.5,
                              child: Container(
                                color: Colors.transparent,
                                width: width / 3.4,
                                child: RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'geomet'),
                                      children: [
                                        const TextSpan(
                                          text: 'Synopsys\n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: snap.data['plot'] +
                                              '\n\n\n\n\n\n\n\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'prodSans',
                                              fontSize: 16),
                                        ),
                                        const TextSpan(
                                          text:
                                              'Released on :                     ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 12),
                                        ),
                                        TextSpan(
                                          text: snap.data['year']
                                                      .toString()
                                                      .split('T')[0] ==
                                                  '0000-00-00'
                                              ? 'N/A\n'
                                              : snap.data['year']
                                                      .toString()
                                                      .split('T')[0] +
                                                  '\n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            fontFamily: 'prodSans',
                                          ),
                                        ),
                                        const TextSpan(
                                          text:
                                              'Director :                           ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 12),
                                        ),
                                        TextSpan(
                                          text: snap.data['dname'] + '\n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            fontFamily: 'prodSans',
                                          ),
                                        ),
                                        const TextSpan(
                                          text: 'Country of origin :          ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 12),
                                        ),
                                        TextSpan(
                                          text: snap.data['country'] + '\n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            fontFamily: 'prodSans',
                                          ),
                                        ),
                                        const TextSpan(
                                          text:
                                              'Language :                         ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 12),
                                        ),
                                        TextSpan(
                                          text: snap.data['lang'] + '\n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            fontFamily: 'prodSans',
                                          ),
                                        ),
                                        const TextSpan(
                                          text:
                                              'Box-office :                       ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 12),
                                        ),
                                        TextSpan(
                                          text: snap.data['box_office'] + '\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'prodSans',
                                              fontSize: 16),
                                        ),
                                        const TextSpan(
                                          text:
                                              'Production :                     ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 12),
                                        ),
                                        TextSpan(
                                          text: snap.data['production'] + '\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'prodSans',
                                              fontSize: 16),
                                        ),
                                        const TextSpan(
                                          text:
                                              'Awards :                             ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                              fontSize: 12),
                                        ),
                                        TextSpan(
                                          text: snap.data['awards'] + '\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'prodSans',
                                              fontSize: 16),
                                        ),
                                      ]),
                                ),
                              ),
                            ),

                            Positioned(
                              top: 560,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Average Rating   ' +
                                        (snap.data['average_rating'] as double)
                                            .toStringAsFixed(2),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 620,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      clipBehavior: Clip.antiAlias,
                                      child: MaterialButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  title: const Center(
                                                      child: Text('Rating')),
                                                  actions: [
                                                    RatingBar.builder(
                                                      initialRating: snap.data[
                                                              'average_rating'] /
                                                          2 as double,
                                                      minRating: 1,
                                                      maxRating: 5,
                                                      direction:
                                                          Axis.horizontal,
                                                      allowHalfRating: true,
                                                      itemCount: 5,
                                                      itemPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 4.0),
                                                      itemBuilder:
                                                          (context, _) =>
                                                              const Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      onRatingUpdate: (rate) {
                                                        rating = 2 * rate;
                                                      },
                                                    ),
                                                    Card(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          10,
                                                        ),
                                                      ),
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      child: MaterialButton(
                                                        color: Colors.red,
                                                        onPressed: () {
                                                          Database().addRating(
                                                              widget
                                                                  .data['m_id'],
                                                              box.read('uname'),
                                                              rating);
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {});
                                                        },
                                                        child: const Text(
                                                            'Submit'),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        child: const Text('Add rating'),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      clipBehavior: Clip.antiAlias,
                                      child: MaterialButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ReviewPage(
                                              mId: widget.data['m_id'],
                                            );
                                          }));
                                        },
                                        child: const Text('Add/View review'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //back button
                            Positioned(
                              top: 20,
                              left: 20,
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      /*   Text(
              widget.data['title'],
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
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
            ), */
                    ],
                  );
                } else {
                  return Center(
                    child: SizedBox(
                      height: 500,
                      width: 500,
                      child: Lottie.network(
                          'https://assets9.lottiefiles.com/packages/lf20_lrjha2vi.json'),
                    ),
                  );
                }
              })),
    );
  }
}
