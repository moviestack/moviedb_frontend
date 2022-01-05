import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moviedb/constants/input_decoration.dart';
import 'package:moviedb/services/database.dart';

class ReviewPage extends StatefulWidget {
  int mId;
  ReviewPage({required this.mId});

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  TextEditingController review_descController = TextEditingController();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Database().getReviews(widget.mId),
        builder: (context, AsyncSnapshot<dynamic> snap) {
          if (snap.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: PreferredSize(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.pink],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight),
                    ),
                    child: const Center(
                      child: Text(
                        'Reviews',
                        style: TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  preferredSize: Size(MediaQuery.of(context).size.width, 100)),
              body: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: snap.data.length != 0
                          ? ListView.builder(
                              itemCount: snap.data.length,
                              itemBuilder: (context, index) {
                                if (snap.data[index]['review_description'] !=
                                    '') {
                                  return Card(
                                    elevation: 3,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: ListTile(
                                      leading: const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      title: Text(
                                        '${snap.data[index]['uname']}' ==
                                                '${box.read('uname')}'
                                            ? 'You'
                                            : '${snap.data[index]['uname']}',
                                      ),
                                      subtitle: Text(
                                        '${snap.data[index]['review_description']}',
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            )
                          : const Center(
                              child: Text(
                                'No reviews found',
                                style: TextStyle(fontSize: 30),
                              ),
                            )),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
        });
  }
}
