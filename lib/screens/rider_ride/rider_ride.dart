import 'package:carpool/components/add_item_card.dart';
import 'package:flutter/material.dart';

class RiderRide extends StatelessWidget {
  static String routeName = "/rider_home";

  const RiderRide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddItemCard(
          header: "Add a ride",
          message:
              "share a ride with others, and , make your ride visible to others",
          buttonText: "Add a ride",
          onPressed: () {},
        ),
      ],
    );
  }
}
