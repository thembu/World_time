import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {

  String location;
  late String time;
  String flag;
  String url;
  late bool isDaytime;

  WorldTime({required this.location , required this.flag , required this.url});

  Future<void> getTime()  async {
    String base = 'http://worldtimeapi.org/api/timezone/';
    http.Response res = await http.get(Uri.parse('$base$url'));
    Map data = jsonDecode(res.body);
    String offset = data['utc_offset'];
    String datetime = data['datetime'];
    DateTime now = DateTime.parse(datetime);
    offset = offset.substring(1 , 3);
    now = now.add(Duration(hours: int.parse(offset)));
     isDaytime = now.hour > 4  && now.hour < 20 ? true : false;
     time =  DateFormat.jm().format(now);
    print(now);
    print('$base$url');

  }


}




