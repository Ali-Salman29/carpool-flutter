import 'package:carpool/components/add_item_card.dart';
import 'package:carpool/screens/ride_detail_form/ride_detail_form.dart';
import 'package:flutter/material.dart';
import 'cards/acceptedridecard.dart';
import 'cards/requestedride.dart';
class RiderRide extends StatelessWidget {
  static String routeName = "/rider_home";

  const RiderRide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 10, children: [
      AddItemCard(
        header: "Add a ride",
        message:
            "share a ride with others, and , make your ride visible to others",
        buttonText: "Add a ride",
        onPressed: () {
          Navigator.of(context).pushNamed(AddRideDetails.routeName);
        },
      ),
      AddItemCard(
        header: "Add a Car",
        message: "To share a ride, you need to add a car first",
        buttonText: "Add a Car",
        onPressed: () {
          Navigator.pushNamed(context, "AddCarDetails.routeName");
        },
      ),
      AcceptedRide(),
      RequestedRide(message: "I am in front of arbisoft", route: 'Karachi to Lahore', pickup_dropoff_Location: 'clifton-johartown', riderName: 'Salman Ahmad',),

    ]);
  }
}