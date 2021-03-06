import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:moviedb/components/moviesgrid.dart';
import 'package:moviedb/screens/browse.dart';
import 'package:moviedb/screens/home.dart';
import 'package:moviedb/services/controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List pages = [
      HomeWidget(width: width),
      BrowseScreenWidget(width: width),
    ];
    Controller controller = Controller();
    return Scaffold(
      body: width >= 1200
          ? Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                        //  color: Colors.blueGrey.withAlpha(20),

                        gradient: LinearGradient(
                            colors: [
                              Colors.pink,
                              Colors.red,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(40))),
                    child: ListView(
                      children: [
                        const ListTile(
                          title: Text(
                            'MovieDB.',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'geomet',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 54,
                        ),
                        const ListTile(
                          title: Text('Menu',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          leading: FaIcon(
                            FontAwesomeIcons.list,
                            color: Colors.white,
                          ),
                        ),
                        ListTile(
                          title: const Text('Home',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          leading: const FaIcon(
                            FontAwesomeIcons.play,
                            color: Colors.white,
                          ),
                          onTap: () {
                            controller.index.value = 0;
                          },
                        ),
                        ListTile(
                          title: const Text('Browse',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          leading: const FaIcon(
                            FontAwesomeIcons.search,
                            color: Colors.white,
                          ),
                          onTap: () {
                            controller.index.value = 1;
                          },
                        ),
                        ListTile(
                          title: const Text('Logout',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold)),
                          leading: const FaIcon(
                            FontAwesomeIcons.signOutAlt,
                            //  color: Color(0xffE50914),
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.of(context).popAndPushNamed('/login');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Obx(() {
                      return AnimatedSwitcher(
                        transitionBuilder: (widget, animation) =>
                            ScaleTransition(
                          scale: animation,
                          child: widget,
                        ),
                        duration: const Duration(milliseconds: 280),
                        child: pages[controller.index.value],
                      );
                    }))
              ],
            )
          : const Center(
              child: Text('This site is designed only for widescreen devices'),
            ),
    );
  }
}
