import 'package:carpool/models/ride.dart';
import 'package:flutter/material.dart';

class UserRide with ChangeNotifier {
  RideArguments? _rideArguments;

  RideArguments? get rideArguments {
    return _rideArguments;
  }

  void setRideArgument(toCity, fromCity, date){
    _rideArguments = RideArguments(toCity: toCity, fromCity: fromCity, date: date);
    notifyListeners();
  }
}