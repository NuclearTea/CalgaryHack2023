class EventItem{
  String eventName = "";
  String location = "";
  String time = "";
  String? img_url;
  bool favorite;
  dynamic tag1;
  dynamic tag2;
  dynamic tag3;

  EventItem({required this.eventName, required this.location, required this.time, this.img_url, required this.favorite, this.tag1, this.tag2, this.tag3});
}