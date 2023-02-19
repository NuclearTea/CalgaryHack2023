import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/event_item.dart';
import 'package:http/http.dart' as http;

class EventProvider with ChangeNotifier{
  List<EventItem> _events = [];
  final url = 'http://10.0.2.2:5000/event';

  List<EventItem> get events {
    return [..._events];
  }

  Future<void> addEvent(String eventt, String loc, String time, String img_url, String tag1, String tag2, String tag3) async {
    if(eventt.isEmpty){
      return;
    }
    Map<String,dynamic> request = {"name": eventt, "location": loc, "time": time, "img_url":img_url, "favorite": false, "tag1": tag1, "tag2": tag2, "tag3": tag3};
    final headers = {'Content-Type' : 'application/json'};
    final response = await http.post(Uri.parse(url), headers: headers, body: json.encode(request));
    Map<String, dynamic> responsePayload = json.decode(response.body);
    final event = EventItem(
      eventName: responsePayload["name"],
      location: responsePayload["location"],
      time: responsePayload["time"],
      img_url: responsePayload["img_url"],
      favorite: responsePayload["favorite"],
      tag1: responsePayload["tag1"],
      tag2: responsePayload["tag2"],
      tag3: responsePayload["tag3"]);
  }

  Future<void> get getEvents async{
    var response;
    try{
      response = await http.get(Uri.parse(url));
      List<dynamic> body = json.decode(response.body);
      _events = body.map((e) => EventItem(
        eventName: e['name'], 
        location: e['location'], 
        time: e['time'], 
        favorite: e['favorite'],
        img_url: e['img_url'],
        tag1: e['tag1'],
        tag2: e['tag2'],
        tag3: e['tag3']
        )
        ).toList();
    }catch(e){
      print(e);
    }

    notifyListeners();
  }

  Future<void> favoriteEvent(String eName) async{
    try{
      final response = await http.patch(Uri.parse("url/$eName"));
      Map<String, dynamic> responsePayload = json.decode(response.body);
      _events.forEach((element) => {
        if(element.eventName == responsePayload["name"]){
          element.favorite = responsePayload["favorite"]
        }
       });
    }catch(e){
      print(e);
    }
    notifyListeners();
  }
  
}