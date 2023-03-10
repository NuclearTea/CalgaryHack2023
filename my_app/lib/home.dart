import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        appBar: AppBar(
          title: const Text("University of Calgary"),
          backgroundColor: const Color(0xFFE92327),
        ),
        body: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Text(
                "Today at UCalgary",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 6,
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.95,
                  enlargeFactor: 0,
                  enlargeCenterPage: true,
                ),
                items: const [
                  Image(
                    image: AssetImage("assets/a1.png"),
                  ),
                  Image(
                    image: AssetImage("assets/a2.png"),
                  ),
                  Image(
                    image: AssetImage("assets/a3.png"),
                  ),
                  Image(
                    image: AssetImage("assets/a4.png"),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text(
                "Events",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 12.5, 0),
                    child: Image(
                      height: 115,
                      image: AssetImage("assets/e1.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 12.5, 0),
                    child: Image(
                      height: 115,
                      image: AssetImage("assets/e2.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 12.5, 0),
                    child: Image(
                      height: 115,
                      image: AssetImage("assets/e3.png"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
