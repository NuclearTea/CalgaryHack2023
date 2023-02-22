import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// MediaQuery.of(context).size.height;
//  MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          title: const Text("University of Calgary"),
          backgroundColor: const Color(0xFFE92327),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    MediaQuery.of(context).size.width * 0.01,
                    0,
                    MediaQuery.of(context).size.width * 0.01),
                child: Text(
                  "Announcements",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.95,
                  enlargeFactor: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
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
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.05,
                    0,
                    0,
                    MediaQuery.of(context).size.width * 0.01),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Happening Today",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView(
                padding: EdgeInsets.fromLTRB(
                    0, 0, MediaQuery.of(context).size.height * 0.02, 0),
                children: [
                  Image(
                    // height: 115,
                    image: AssetImage("assets/e1.png"),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, MediaQuery.of(context).size.width * 0.02, 0),
                    child: Image(
                      // height: 10,
                      image: AssetImage("assets/e2.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 0, MediaQuery.of(context).size.width * 0.02, 0),
                    child: Image(
                      // height: 115,
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
