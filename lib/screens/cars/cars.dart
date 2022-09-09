import 'package:carpool/models/ride.dart';
import 'package:carpool/providers/rider.dart';
import 'package:carpool/screens/cars/components/car_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cars extends StatelessWidget {
  const Cars({Key? key}) : super(key: key);
  static String routeName = "/cars";

  @override
  Widget build(BuildContext context) {
    return Consumer<Rider>(
      builder: (context, rider, ch) {
        return ListView(
          children: rider.cars.asMap().entries.map((entry) => CarCard(
                  index: entry.key,
                  carName: entry.value.car,
                  makeYear: entry.value.makeYear.toString(),
                  registrationNo: entry.value.registrationNumber.toUpperCase(),
                  onRide: (){},
                ),
              ).toList(),
        );
      }
    );
  }
}
