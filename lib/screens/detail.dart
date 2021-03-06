import 'package:flutter/material.dart';

import 'package:trip_project/models/trip.dart';
import 'package:trip_project/shared/heart.dart';

class TripDetail extends StatelessWidget {
  final Trip trip;

  const TripDetail({Key key, this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          children: [
            ClipRRect(
              child: Hero(
                tag: trip.imageUrl,
                child: Image.network(
                  trip.imageUrl,
                  fit: BoxFit.cover,
                  height: 360,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ListTile(
                title: Text(trip.name),
                subtitle: Text(
                    "${trip.dayNight} night stay for only ${trip.unitPrice} \$"),
                trailing: Heart()),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu tellus, imperdiet faucibus urna at, pellentesque lacinia diam. Pellentesque tortor dui, tristique quis ipsum ac, tempor consequat dolor. Phasellus volutpat volutpat mauris a venenatis. Vivamus in molestie est, maximus sodales augue. Etiam sagittis gravida venenatis. Morbi ac vestibulum magna. Nulla eu nisi sem. Aliquam vel aliquam leo. Morbi est nunc, fringilla eu neque sed, tincidunt placerat tortor.",
                style: TextStyle(
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
