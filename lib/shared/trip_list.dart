import 'package:flutter/material.dart';

import 'package:trip_project/models/trip.dart';
import 'package:trip_project/screens/detail.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Widget> _tripTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addTrips();
    });
  }

  void _addTrips() {
    List<Trip> _trips = [
      Trip(
          name: "Holiday Hotel",
          imageUrl:
              "https://cdn.pixabay.com/photo/2017/01/20/00/30/maldives-1993704_960_720.jpg",
          unitPrice: "50",
          dayNight: "3"),
      Trip(
          name: "Golf Hotel",
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/10/30/20/13/sunrise-1014712_960_720.jpg",
          unitPrice: "100",
          dayNight: "2"),
      Trip(
          name: "Resort Hotel",
          imageUrl:
              "https://cdn.pixabay.com/photo/2016/03/04/19/36/beach-1236581_960_720.jpg",
          unitPrice: "250",
          dayNight: "5"),
    ];

    Future ft = Future(() {});

    _trips.forEach((Trip trip) {
      ft = ft.then((_) {
        return Future.delayed(Duration(milliseconds: 200), () {
          _tripTiles.add(_buildTripTile(trip));
          _listKey.currentState.insertItem(_tripTiles.length - 1);
        });
      });
    });
  }

  Widget _buildTripTile(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => TripDetail(
                      trip: trip,
                    )));
      },
      contentPadding: EdgeInsets.all(10.0),
      leading: Container(
        width: 70,
        height: 70,
        child: Hero(
          tag: trip.imageUrl,
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent[200],
            backgroundImage: NetworkImage(trip.imageUrl),
          ),
        ),
      ),
      title: Text(trip.name),
      subtitle: Text("${trip.dayNight} Night ${trip.unitPrice} \$"),
      trailing: Icon(
        Icons.navigate_next,
        color: Colors.grey,
        size: 40,
      ),
    );
  }

  Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      shrinkWrap: true,
      key: _listKey,
      initialItemCount: _tripTiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(_offset),
          child: _tripTiles[index],
        );
      },
    );
  }
}
