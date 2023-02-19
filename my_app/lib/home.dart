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
          backgroundColor: Color(0xFFE92327),
        ),
        body: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Text(
                "Today at UCalgary",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              flex: 6,
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.95,
                  enlargeFactor: 0,
                  // autoPlay: true,
                  // aspectRatio: 1.0,
                  enlargeCenterPage: true,
                ),
                items: [
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    // color: Colors.black,
                    child: Image(
                      image: AssetImage("assets/a1.png"),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.purple,
                  ),
                  Container(
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //             height: 200,
            //             width: 400,
            //             color: Colors.blue,
            //             child: const Text(
            //               "Something",
            //               style: TextStyle(
            //                 fontSize: 16,
            //               ),
            //             )),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //             height: 200,
            //             width: 400,
            //             color: Colors.green,
            //             child: const Text(
            //               "Something",
            //               style: TextStyle(
            //                 fontSize: 16,
            //               ),
            //             )),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //           height: 200,
            //           width: 400,
            //           color: Colors.green,
            //           child: const Text(
            //             "Something",
            //             style: TextStyle(
            //               fontSize: 16,
            //             ),
            //           ),
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //             height: 200,
            //             width: 400,
            //             color: Colors.green,
            //             child: const Text(
            //               "Something",
            //               style: TextStyle(
            //                 fontSize: 16,
            //               ),
            //             )),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //             height: 200,
            //             width: 400,
            //             color: Colors.green,
            //             child: const Text(
            //               "Something",
            //               style: TextStyle(
            //                 fontSize: 16,
            //               ),
            //             )),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //             height: 200,
            //             color: Colors.green,
            //             child: const Text(
            //               "Something",
            //               style: TextStyle(
            //                 fontSize: 16,
            //               ),
            //             )),
            //       ),
            //     ],
            //   ),
            // ),
            const Expanded(
              flex: 1,
              child: Text(
                "Events",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //       height: 200,
                  //       color: Colors.deepPurple,
                  //       child: const Text(
                  //         "Something",
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //         ),
                  //       )),
                  // ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 12.5, 0),
                    child: Container(
                      child: Image(
                        height: 115,
                        image: AssetImage("assets/e1.png"),
                      ),
                    ),
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
              ),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
