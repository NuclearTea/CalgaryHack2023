import 'package:flutter/material.dart';
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
      bottomNavigationBar: NavigationBar(
        height: 50,
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.email_outlined),
              selectedIcon: Icon(Icons.email),
              label: "Page 1"),
          NavigationDestination(
              icon: Icon(Icons.chat_bubble_outlined),
              selectedIcon: Icon(Icons.chat_bubble),
              label: "Page 1"),
          NavigationDestination(
              icon: Icon(Icons.videocam_outlined),
              selectedIcon: Icon(Icons.videocam),
              label: "Page 1"),
        ],
      ),
    ));
  }
}
