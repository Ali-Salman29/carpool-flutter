import 'dart:ffi';

import 'package:carpool/constants.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String ridenumber;
  final String route;
  final String carname;
  final String dateTime;

  const HistoryCard({
    Key? key,
    required this.ridenumber,
    required this.route,
    required this.carname,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 50,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          color: Colors.black,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Wrap(
              spacing: 5,
              children: [
                Text(
                  "Ride#$ridenumber",
                  style: const TextStyle(fontSize: 20),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(dateTime),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                )
              ],
            ),
            Text(
              route,
            ),
            Text(
              carname,
            ),
          ]),
        )
      ],
    );
  }
}
