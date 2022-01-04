import 'package:flutter/material.dart';
import 'package:moviedb/services/database.dart';

class ReviewPage extends StatefulWidget {
  int mId;
  ReviewPage({required this.mId});

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Database().getReviews(widget.mId),
        builder: (context, AsyncSnapshot<dynamic> snap) {
          if (snap.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Center(
                child: ListView.builder(
                    itemCount: snap.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child:
                            Text('${snap.data[index]['review_description']}'),
                      );
                    }),
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
