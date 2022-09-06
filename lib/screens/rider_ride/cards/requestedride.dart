import 'package:carpool/constants.dart';
import 'package:flutter/material.dart';

class RequestedRide extends StatelessWidget {
  final String message;
  final String route;
  final String pickup_dropoff_Location;
  final String riderName;
  const RequestedRide(
      {Key? key,
      required this.message,
      required this.route,
      required this.pickup_dropoff_Location, required this.riderName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            route,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            pickup_dropoff_Location,
            style: TextStyle(fontSize: 10, color: Colors.white38),
          ),
          Text(message),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 10,
                children:  [
                  const CircleAvatar(
                    radius: 15,
                    child: Text("S"),
                  ),
                  Text(
                     riderName,
                    style: TextStyle(color: Colors.white38),
                  )
                ],
              ),
              Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        primary: kErrorColor,
                        shape: StadiumBorder()),
                    onPressed: () {},
                    child: Text("Reject"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        shape: StadiumBorder()),
                    onPressed: () {},
                    child: Text("Accept"),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
