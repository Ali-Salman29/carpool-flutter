import 'package:carpool/screens/ride_detail_form/ride_detail_form.dart';
import 'package:flutter/widgets.dart';
import 'screens/rider_home/rider_home.dart';
import 'screens/Car-detail-form/addcardetails.dart';
import 'MainFlowScreens/UserRideDetails.dart';
import 'screens/CarHome/carslist.dart';
import 'MainFlowScreens/components/confirmation.dart';
import 'MainFlowScreens/signup_screen.dart';
final Map<String, WidgetBuilder> routes = {
  RiderHome.routeName: (context) => const RiderHome(),
  AddRideDetails.routeName: (context) => const AddRideDetails(),
  "AddCarDetails.routeName":(context) => const AddCarDetails(),
  "Carslist":(context) => const CarsList(),
  'UserSelectRide':(context) => const SelectRide(),
  'ConfirmationScreen':(context) => const Confirmation(),
   'SignUpScreen':(context) => SignUpScreen(),
};
