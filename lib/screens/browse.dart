import 'package:flutter/material.dart';
import 'package:moviedb/components/moviesgrid.dart';
import 'package:moviedb/constants/input_decoration.dart';
import 'package:moviedb/services/database.dart';

// ignore: must_be_immutable
class BrowseScreenWidget extends StatefulWidget {
  double width;
  BrowseScreenWidget({Key? key, required this.width}) : super(key: key);

  @override
  State<BrowseScreenWidget> createState() => _BrowseScreenWidgetState();
}

class _BrowseScreenWidgetState extends State<BrowseScreenWidget> {
  List<String> titles = [
    '1.language',
    '2.director name',
    //  'year of release',
    '3.minimum box-office collection',
    '4.maximum box-office collection',
    '5.country of origin',
    '6.genre',
    '7.above rating',
    '8.below rating'
  ];
  String selectedVal = '1.language';
  String searchingValue = '';
  String index = '1';
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Database _db = Database();
    return Container(
      color: Colors.grey.withAlpha(10),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                    width: 500,
                    child: TextFormField(
                      cursorColor: Colors.red,
                      decoration: inputDecoration.copyWith(
                          labelText:
                              ' search by entering ${selectedVal.toString().split('.')[1]}'),
                      onFieldSubmitted: (String value) {
                        setState(() {
                          isSearching = true;
                          searchingValue = value;
                          index = selectedVal.split('.')[0];
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: size.width / 10),
                SizedBox(
                  height: 50,
                  width: 500,
                  child: DropdownButtonFormField(
                    // Initial Value
                    value: selectedVal.toString(),

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: titles.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items.split('.')[1],
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedVal = newValue!;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Center(
              child: isSearching
                  ? MoviesGrid(
                      future: _db.handleBrowseRequests(searchingValue, index))
                  : Text('Results will appear here'),
            ),
          )
        ],
      ),
    );
  }
}
