import 'package:carpool/screens/car-detail-form/add_car_details.dart';
import 'package:carpool/screens/rider_ride/components/add_item_card.dart';
import 'package:carpool/screens/ride_detail_form/ride_detail_form.dart';
import 'package:carpool/screens/rider_ride/components/requested_ride_card.dart';
import 'package:flutter/material.dart';
import 'components/accepted_ride_card.dart';

class RiderRide extends StatelessWidget {
  static String routeName = "/rider_home";

  const RiderRide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(runSpacing: 10, children: [
      AddItemCard(
        header: "Add a ride",
        message:
            "share a ride with others, and , make your ride visible to others",
        buttonText: "Add a ride",
        onPressed: () {
          Navigator.of(context).pushNamed(AddRideDetails.routeName);
        },
      ),
      AddItemCard(
        header: "Add a Car",
        message: "To share a ride, you need to add a car first",
        buttonText: "Add a Car",
        onPressed: () {
          Navigator.of(context).pushNamed(AddCarDetails.routeName);
        },
      ),
      AcceptedRideCard(
        fromCity: "Hyderabad",
        toCity: "Karachi",
        pickUp: "Qasim Chok",
        dropOff: "Sabzi Mandi",
        userName: "Kamran Ali",
        userUrl: "https://i.ibb.co/Yj1Xs2k/Usama.jpg",
        onWhatsAppClick: () {},
      ),
      const RequestedRideCard(
        message: "I am in front of arbisoft",
        userName: 'Salman Ahmad',
        userUrl: "https://i.ibb.co/Yj1Xs2k/Usama.jpg",
        toCity: 'Islamabad',
        fromCity: 'Karachi',
        pickUp: 'Latifabad',
        dropOff: 'Karimabad',
      ),
    ]);
  }
}
