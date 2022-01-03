import 'package:flutter/material.dart';
import 'package:moviedb/screens/movie_page.dart';
import 'package:moviedb/services/database.dart';
import 'package:lottie/lottie.dart';

class MoviesGrid extends StatefulWidget {
  Future future;
  MoviesGrid({Key? key, required this.future}) : super(key: key);

  @override
  _MoviesGridState createState() => _MoviesGridState();
}

class _MoviesGridState extends State<MoviesGrid> {
  late ScrollController _controller;
  bool isHover = false;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: widget.future,
      builder: (context, AsyncSnapshot<dynamic> snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(
            child: SizedBox(
              height: 500,
              width: 500,
              child: Lottie.network(
                  'https://assets9.lottiefiles.com/packages/lf20_lrjha2vi.json'),
            ),
          );
        } else if (snap.data!.length == 0) {
          return Center(
              child: Lottie.network(
                  'https://assets1.lottiefiles.com/packages/lf20_y6ilh1zw.json'));
        } else {
          return GridView.builder(
            controller: _controller,
            shrinkWrap: true,
            itemCount: snap.data!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.5 * size.height / size.width),
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  clipBehavior: Clip.antiAlias,
                  elevation: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MoviePage(data: snap.data[i]);
                      }));
                    },
                    child: Hero(
                      tag: snap.data[i]['poster_url'],
                      child: Image.network(
                        snap.data[i]['poster_url'],
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
              );
            },
          );
        }
      },
    );
  }
}
