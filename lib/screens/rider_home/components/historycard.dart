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
    required this.carname, required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing:50,children: [
Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      color: Colors.black,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
       Wrap(spacing: 5,children: [
         Text(
          "Ride#$ridenumber",
          style: TextStyle(fontSize: 20),
        ),
        Container(padding: EdgeInsets.all(20),
          child: Text(dateTime),
        decoration: BoxDecoration(
    border: Border.all(
      
    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
  ),)
       ],),
        Text(
          route,
          style: TextStyle(fontSize: 10, color: Colors.white38),
        ),
         Text(
          carname,
          style: TextStyle(fontSize: 10, color: Colors.white38),
        ),
      ]),
    )
    ],)
    ;
  }
}
