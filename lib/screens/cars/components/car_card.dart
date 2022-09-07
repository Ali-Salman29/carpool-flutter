import 'package:carpool/constants.dart';
import 'package:carpool/custom_icons.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final String carName;
  final String makeYear;
  final String registrationNo;
  final VoidCallback onRide;

  const CarCard(
      {Key? key,
      required this.carName,
      required this.makeYear,
      required this.registrationNo,
      required this.onRide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                carName.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                registrationNo,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Text("2021"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                CustomIcons.car,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      shape: const StadiumBorder()),
                  onPressed: () {},
                  child: const Text("Ride"))
            ],
          )
        ],
      ),
    );
  }
}
