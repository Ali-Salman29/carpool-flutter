import 'package:carpool/custom_car_icons.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CarsList extends StatefulWidget {
  const CarsList({Key? key}) : super(key: key);

  @override
  State<CarsList> createState() => _CarsListState();
}

class _CarsListState extends State<CarsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
 Container(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
          color: Colors.black,
          border: BorderDirectional(
        bottom: BorderSide(color: kTextLightColor),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "CULTUS",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("ACC-2021"),
            ],
          ),
          const Text("2021"),
          // ignore: prefer_const_constructors
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Icon(CustomCar.car,),
          ElevatedButton(style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          primary: Colors.green,
                          shape: const StadiumBorder()),onPressed: () {}, child:   const Text("Ride"))],)
        ],
      ),
    )
    ],)
   ;
  }
}
