import 'package:carpool/custom_icons.dart';
import 'package:carpool/screens/cars/components/car_card.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class Cars extends StatefulWidget {
  const Cars({Key? key}) : super(key: key);
  static String routeName = "/cars";
  @override
  State<Cars> createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarCard(
            carName: 'Cultus',
            makeYear: '2018',
            registrationNo: 'FDX-2003',
            onRide: (){},
        )
      ],
    );
  }
}
