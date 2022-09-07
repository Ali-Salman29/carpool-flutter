import 'package:intl/intl.dart';

class City {
  final int? id;
  final String name;

  City({this.id, required this.name});

  factory City.fromMap(Map<String, dynamic> data) {
    return City(
      id: data['id'],
      name: data['name'],
    );
  }
}

class Route {
  final int? id;
  final String toCity;
  final String fromCity;
  final double rate;

  Route(
      {this.id,
      required this.toCity,
      required this.fromCity,
      required this.rate});

  factory Route.fromMap(Map<String, dynamic> data, int id) {
    return Route(
      id: id,
      toCity: data['to_city'],
      fromCity: data['from_city'],
      rate: data['rate'].toDouble(),
    );
  }
}

class Car {
  final int? id;
  final String car;
  final int makeYear;
  final String color;
  final int seatingCapacity;
  final String registrationNumber;

  Car({
    this.id,
    required this.car,
    required this.makeYear,
    required this.color,
    required this.seatingCapacity,
    required this.registrationNumber,
  });

  factory Car.fromMap(Map<String, dynamic> data) {
    return Car(
        id: data['id'],
        car: data['car'],
        makeYear: data['make_year'],
        color: data['color'],
        seatingCapacity: data['seating_capacity'],
        registrationNumber: data['registration_number']);
  }
}

class Ride {
  final int? id;
  final int availableSeats;
  final int bookedSeats;
  final String gender;
  final Route route;
  final Car car;
  final DateTime date;
  final List<String> pickupLocations;
  final List<String> dropOffLocations;

  Ride({
    this.id,
    required this.availableSeats,
    required this.bookedSeats,
    required this.gender,
    required this.route,
    required this.car,
    required this.date,
    required this.pickupLocations,
    required this.dropOffLocations,
  });

  factory Ride.fromMap(Map<String, dynamic> data) {
    final utcDateTime =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(data['date'], true);
    var dateLocal = utcDateTime.toLocal();
    return Ride(
      id: data['id'],
      availableSeats: data['available_seats'],
      bookedSeats: data['booked_seats'],
      gender: data['gender'],
      route: Route.fromMap(data['route_data'], data['route']),
      car: Car.fromMap(data['car_data']),
      date: dateLocal,
      pickupLocations: (data['pickup_location'] as List<dynamic>)
          .map((e) => e['address']! as String)
          .toList(),
      dropOffLocations: (data['dropoff_location'] as List<dynamic>)
          .map((e) => e['address']! as String)
          .toList(),
    );
  }
}

class RideArguments {
  final int toCity;
  final int fromCity;
  final String date;

  RideArguments({required this.toCity, required this.fromCity, required this.date});
}
