import 'package:carpool/screens/ride_detail_form/ride_detail_form.dart';
import 'package:flutter/widgets.dart';
import 'screens/rider_home/rider_home.dart';

final Map<String, WidgetBuilder> routes = {
  RiderHome.routeName: (context) => const RiderHome(),
  AddRideDetails.routeName: (context) => const AddRideDetails(),
};
