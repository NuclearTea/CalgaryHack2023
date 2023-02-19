import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_app/main.dart';
import 'package:my_app/events.dart';
import 'package:my_app/home.dart';
import 'package:my_app/mypage.dart';
import 'package:my_app/roomfinder.dart';
import 'package:my_app/providers/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  final pages = <Widget>[
    const HomePage(),
    const RoomFinder(),
    const EventsPage(),
    const PersonalPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => EventProvider())],
      child: MaterialApp(
          home: Scaffold(
        body: pages.elementAt(index),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GNav(
                backgroundColor: Colors.white,
                gap: 8,
                padding: const EdgeInsets.all(16),
                tabs: const [
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
                    icon: Icons.map_outlined,
                    // iconColor: Colors.white,
                    textColor: Colors.white,
                    text: 'Map',
                  ),
                  GButton(
                    backgroundColor: Color(0xFFE92327),
                    icon: Icons.calendar_month,
                    iconActiveColor: Colors.white,
                    text: 'Events',
                    textColor: Colors.white,
                  ),
                  GButton(
                    backgroundColor: Color(0xFFE92327),
                    icon: Icons.person,
                    iconActiveColor: Colors.white,
                    text: 'Account',
                    textColor: Colors.white,
                  ),
                ],
                selectedIndex: index,
                onTabChange: (value) => setState(() {
                  print("Going to: $value");
                  index = value;
                }),
              )),
        ),
      )),
    );
  }
}
