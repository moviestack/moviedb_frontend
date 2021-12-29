import 'package:flutter/material.dart';
import 'package:moviedb/components/moviesgrid.dart';

class BrowseScreenWidget extends StatelessWidget {
  double width;
  BrowseScreenWidget({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withAlpha(10),
      child: const Center(
        child: Text('Browse page coming soon'),
      ),
    );
  }
}
