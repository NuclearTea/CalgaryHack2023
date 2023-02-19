import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))),
          title: const Text("Your UCalgary"),
          backgroundColor: const Color(0xFFE92327),
        ),
        body: Column(
          children: [
            const Expanded(
              flex: 5,
              child: Image(image: AssetImage("assets/Card.png")),
            ),
            const Expanded(
              flex: 1,
              child: Text(
                "Your Schedule",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView(
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.5, 0, 12.5, 0),
                    child: Image(
                      height: 115,
                      image: AssetImage("assets/s1.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.5, 0, 12.5, 0),
                    child: Image(
                      height: 115,
                      image: AssetImage("assets/s2.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.5, 0, 12.5, 0),
                    child: Image(
                      height: 115,
                      image: AssetImage("assets/s3.png"),
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
