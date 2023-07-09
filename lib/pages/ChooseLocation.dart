import 'package:flutter/material.dart';
import 'package:busapp/services/World_Time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});



  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void UpdateTime(index) async {
    WorldTime instance = locations[index];

    await instance.getTime();

    Navigator.pop(context , {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime
    });

  }


  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Location'),
        centerTitle: true,

      ),

      body: ListView.builder(itemBuilder: (context , index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1 , horizontal: 4),
          child: Card(
            child :
            ListTile(onTap: () {
              UpdateTime(index);
            },
              title: Text(locations[index].location),
              leading: CircleAvatar(backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            )
          ),
        );
      }, itemCount: locations.length,
      )

    );

  }
}
