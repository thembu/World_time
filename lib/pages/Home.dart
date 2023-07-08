import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);


    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color  bgColor = data['isDaytime'] ? Colors.lightBlueAccent : Colors.indigo;
    return  Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),


            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
        children: <Widget>[

              FilledButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Location');
                  },
                  icon: Icon(Icons.edit_location),
                 label:Text('Change Location') ,
              ),

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data['location'],
                  style: TextStyle(fontSize: 30, letterSpacing: 2, fontWeight: FontWeight.bold),
                  ),
                ],
              ),


            SizedBox(height: 20,),

            Text(data['time'], style: TextStyle(
                fontSize: 60
            ),)

        ],
      ),
            ),
          )),
    );
  }
}
