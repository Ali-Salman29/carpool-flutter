import 'package:carpool/screens/car-detail-form/add_car_details.dart';
import 'package:carpool/screens/ride_confirmation/ride_confirmation.dart';
import 'package:carpool/screens/ride_detail_form/ride_detail_form.dart';
import 'package:carpool/screens/rides/rides.dart';
import 'package:carpool/screens/search_ride/search_ride.dart';
import 'package:carpool/screens/select_ride/select_ride.dart';
import 'package:carpool/screens/signin/singin.dart';
import 'package:flutter/widgets.dart';
import 'screens/rider_home/rider_home.dart';
import 'screens/cars/cars.dart';
import 'screens/signup/signup_screen.dart';

final Map<String, WidgetBuilder> routes = {
  RiderHome.routeName: (context) => const RiderHome(),
  AddRideDetails.routeName: (context) => const AddRideDetails(),
  AddCarDetails.routeName : (context) => const AddCarDetails(),
  Cars.routeName: (context) => const Cars(),
  SelectRide.routeName: (context) => const SelectRide(),
  SignUp.routeName: (context) => const SignUp(),
  RideConfirmation.routeName: (context) => const RideConfirmation(),
  SignIn.routeName: (context) => const SignIn(),
  Rides.routeName: (context) => const Rides(),
  SearchRide.routeName: (context) => const SearchRide(),
};
