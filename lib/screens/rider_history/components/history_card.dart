import 'package:carpool/constants.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String rideNumber;
  final String route;
  final String carName;
  final String dateTime;

  const HistoryCard({
    Key? key,
    required this.rideNumber,
    required this.route,
    required this.carName,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Wrap(
            runSpacing: 5,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ride#$rideNumber",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: const BoxDecoration(
                        color: Color(0xFF54565D),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      dateTime,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                  width: double.infinity,
                  child: Text(
                    route,
                    style: const TextStyle(
                        color: kTextLightColor, fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                width: double.infinity,
                child: Text(carName,
                    style: const TextStyle(
                        color: kTextLightColor, fontWeight: FontWeight.w600)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
