import 'package:busapp/pages/ChooseLocation.dart';
import 'package:busapp/pages/Load.dart';
import 'package:flutter/material.dart';
import 'package:busapp/pages/Home.dart' ;
void main()  => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/Home' : (context) => Home(),
    '/Location' : (context) => ChooseLocation()
  },
));






