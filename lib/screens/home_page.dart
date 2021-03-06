import 'package:flutter/material.dart';

import 'package:trip_project/shared/trip_list.dart';
import 'package:trip_project/shared/screen_title.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 1.5,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/beach.jpg"),
                ),
              ),
              Positioned(
                left: 35,
                top: 50,
                child: ScreenTitle(
                  title: "Trips List...",
                ),
              ),
            ],
          ),
          TripList(),
        ],
      ),
    );
  }
}
