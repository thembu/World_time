import 'package:flutter/material.dart';
import 'package:busapp/services/World_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

 void setUpWorldTime() async {

   WorldTime instance = WorldTime(location: 'Chicago', flag: 'germany.png', url: 'America/Chicago');

   await instance.getTime();
   print(instance.time);

   Navigator.pushReplacementNamed(context, '/Home',arguments: {
     'location' : instance.location,
     'flag' : instance.flag,
     'time' : instance.time,
     'isDaytime' : instance.isDaytime
   });

 }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();

  }

  @override
  Widget build(BuildContext context) {




    return  const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(

        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),

      ),
    );
  }
}
