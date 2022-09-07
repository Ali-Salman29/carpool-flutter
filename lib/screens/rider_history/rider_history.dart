import 'package:flutter/material.dart';
import 'components/history_card.dart';

class RiderHistory extends StatelessWidget {
  static String routeName = "/rider_home";

  const RiderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 10, children: const [
      HistoryCard(
        rideNumber: "200923",
        route: "Lahore to Islamabad",
        carName: "Mehran",
        dateTime: "10-09-2022",
      )
    ]);
  }
}
