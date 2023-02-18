import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_app/events.dart';
import 'package:my_app/home.dart';
import 'package:my_app/roomfinder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  final pages = <Widget>[
    const HomePage(),
    const EventsPage(),
    const RoomFinder()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: pages[index],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
              backgroundColor: Colors.white,
              // tabBorderRadius: 10,
              // tabBorder: Border,
              gap: 8,
              // tabBackgroundColor: Colors.grey,
              padding: EdgeInsets.all(16),
              // backgroundColor: Colors.black,
              // navigation bar padding
              tabs: [
                GButton(
                  backgroundColor: Color(0xFFE92327),
                  icon: Icons.home,
                  iconActiveColor: Colors.white,
                  text: 'Home',
                  textColor: Colors.white,
                ),
                GButton(
                  backgroundColor: Color(0xFFE92327),
                  iconActiveColor: Colors.white,
                  icon: Icons.email,
                  // iconColor: Colors.white,
                  textColor: Colors.white,
                  text: 'Likes',
                ),
                GButton(
                  backgroundColor: Color(0xFFE92327),
                  icon: Icons.favorite,
                  iconActiveColor: Colors.white,
                  text: 'Search',
                  textColor: Colors.white,
                ),
                GButton(
                  backgroundColor: Color(0xFFE92327),
                  icon: Icons.usb_rounded,
                  iconActiveColor: Colors.white,
                  textColor: Colors.white,
                  text: 'Profile',
                )
              ]),
        ),
      ),
    ));
  }
}
