import 'package:carpool/screens/ride_detail_form/ride_detail_form.dart';
import 'package:flutter/widgets.dart';
import 'screens/rider_home/rider_home.dart';
import 'screens/Car-detail-form/add_car_details.dart';
import 'main_flow_screens/user_ride_details.dart';
import 'screens/car_home/carslist.dart';
import 'main_flow_screens/components/confirmation.dart';
import 'main_flow_screens/signup_screen.dart';

final Map<String, WidgetBuilder> routes = {
  RiderHome.routeName: (context) => const RiderHome(),
  AddRideDetails.routeName: (context) => const AddRideDetails(),
  "AddCarDetails.routeName": (context) => const AddCarDetails(),
  "Carslist": (context) => const CarsList(),
  'UserSelectRide': (context) => const SelectRide(),
  'ConfirmationScreen': (context) => const Confirmation(),
  'SignUpScreen': (context) => SignUpScreen(),
};
