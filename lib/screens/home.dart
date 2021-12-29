import 'package:flutter/material.dart';
import 'package:moviedb/components/moviesgrid.dart';

class HomeWidget extends StatelessWidget {
  double width;
  HomeWidget({Key? key, required this.width}) : super(key: key);

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withAlpha(10),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 40, top: 10),
                  child: SizedBox(
                    width: width / 5.6,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        controller: _searchController,
                        onFieldSubmitted: (value) {},
                        decoration: InputDecoration(
                          label: SizedBox(
                            width: 100,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.search,
                                  color: Colors.amber,
                                ),
                                Text(
                                  'Search...',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          hintText: 'example ->The Matrix',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 2.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10, top: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red,
                    child: Text(
                      'A',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Text(
                    'Abhilash Hegde',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(
            flex: 8,
            child: Center(
              child: MoviesGrid(),
            ),
          )
        ],
      ),
    );
  }
}
