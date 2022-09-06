import 'dart:ui';

import 'package:carpool/more_custom_icons_icons.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class AcceptedRide extends StatefulWidget {
  const AcceptedRide({Key? key}) : super(key: key);

  @override
  State<AcceptedRide> createState() => _AcceptedRideState();
}

class _AcceptedRideState extends State<AcceptedRide> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(color: kTextLightColor),
          bottom: BorderSide(color: kTextLightColor),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Karachi-Islamabad",
            style: TextStyle(fontSize: 20),
          ),
          const Text(
            "QasimChowk-TeenTalwar",
            style: TextStyle(fontSize: 10, color: Colors.white38),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 10,
                children: const [
                  CircleAvatar(
                    radius: 15,
                    child: Text("S"),
                  ),
                  Text("Salman Ahmad",style: TextStyle(color: Colors.white38),)
                ],
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {},
                  icon: const Icon(MoreCustomIcons.whatsapp),
                  label: const Text("WhatsApp"))
            ],
          )
        ],
      ),
    );
  }
}
