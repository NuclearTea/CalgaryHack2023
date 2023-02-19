import 'package:flutter/material.dart';
import 'package:my_app/providers/event_provider.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Events"),
            backgroundColor: const Color(0xFFE92327),
          ),
          body: Column(children: [
            FutureBuilder(
                future: Provider.of<EventProvider>(context, listen: false)
                    .getEvents,
                builder: (context, snapshot) => snapshot.connectionState ==
                        ConnectionState.waiting
                    ? const Center(child: CircularProgressIndicator())
                    : Consumer<EventProvider>(
                        child: Center(
                          heightFactor:
                              MediaQuery.of(context).size.height * 0.03,
                          child: const Text(
                            'You have no events.',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        builder: (context, value, child) => value.events.isEmpty
                            ? child as Widget
                            : Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: value.events.length,
                                    itemBuilder: (context, index) => Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 20.0),
                                        child: Stack(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              100))),
                                              child: Image(
                                                  image: NetworkImage(value
                                                      .events[index].img_url)),
                                            ),
                                            Positioned(
                                                // height: 100,
                                                bottom: 10,
                                                left: 50,
                                                right: 50,
                                                child: Container(
                                                  // width: double.infinity,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          value.events[index]
                                                              .eventName,
                                                          style: const TextStyle(
                                                              color: Color(
                                                                  0xFFE92327),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          value.events[index]
                                                              .time,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(value.events[index]
                                                            .location),
                                                        Checkbox(
                                                            activeColor:
                                                                Colors.amber,
                                                            shape:
                                                                const StarBorder(
                                                                    points: 5),
                                                            value: value
                                                                .events[index]
                                                                .favorite,
                                                            onChanged:
                                                                (bool? val) {
                                                              Provider.of<EventProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .favoriteEvent(value
                                                                      .events[
                                                                          index]
                                                                      .eventName);
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        )),
                                  ),
                                ))))
          ])),
    );
  }
}
