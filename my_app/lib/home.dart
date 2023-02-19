import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 200, color: Colors.deepPurple),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 200, color: Colors.deepPurple),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                color: Colors.deepPurple,
                child: const Text(
                  "Something",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 200, color: Colors.deepPurple),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 200, color: Colors.deepPurple),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(height: 200, color: Colors.deepPurple),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget buildCard() => Container(
        width: 200,
        height: 200,
        color: Colors.black,
      );
}
