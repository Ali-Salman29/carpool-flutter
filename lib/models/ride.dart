import 'package:intl/intl.dart';

class Point {
  final double longitude;
  final double latitude;

  Point({required this.longitude, required this.latitude});

  factory Point.fromMap(Map<String, dynamic> data) {
    return Point(
      longitude: data['longitude'],
      latitude: data['latitude'],
    );
  }
}

class Location {
  final Point location;
  final String address;

  Location({required this.location, required this.address});

  factory Location.fromMap(Map<String, dynamic> data) {
    return Location(
      location: Point.fromMap(data['location']),
      address: data['address'],
    );
  }
}

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

class CityRoute {
  final int? id;
  final City toCity;
  final City fromCity;
  final double rate;

  CityRoute(
      {this.id,
      required this.toCity,
      required this.fromCity,
      required this.rate});

  factory CityRoute.fromMap(Map<String, dynamic> data) {
    return CityRoute(
      id: data['id'],
      toCity: City.fromMap(data['to_city']),
      fromCity: City.fromMap(data['from_city']),
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'car': car,
      'make_year': makeYear,
      'color': color,
      'seating_capacity': seatingCapacity,
      'registration_number': registrationNumber,
    };
  }
}

class Ride {
  final int? id;
  final int availableSeats;
  final int bookedSeats;
  final String gender;
  final CityRoute route;
  final Car car;
  final DateTime date;
  final List<Location> pickupLocations;
  final List<Location> dropOffLocations;

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
    ///
    /// {
    //             "id": 23,
    //             "pickup_locations": [
    //                 {
    //                     "address": "Hotel City Gate, National Highway, opposite Central Jail, Heerabad, Hyderabad",
    //                     "location": {
    //                         "longitude": 25.4073296,
    //                         "latitude": 68.3669425
    //                     }
    //                 }
    //             ],
    //             "dropoff_locations": [
    //                 {
    //                     "address": "Karimabad",
    //                     "location": {
    //                         "longitude": 67.026285,
    //                         "latitude": 24.8992661
    //                     }
    //                 },
    //             ],
    //             "car": {
    //                 "id": 1,
    //                 "car": "Caltus",
    //                 "make_year": 2021,
    //                 "color": "White",
    //                 "seating_capacity": 4,
    //                 "registration_number": "BRX-1232",
    //                 "owner": 1
    //             },
    //             "route": {
    //                 "id": 336,
    //                 "to_city": {
    //                     "id": 1,
    //                     "name": "Karachi",
    //                     "province": "Sindh"
    //                 },
    //                 "from_city": {
    //                     "id": 6,
    //                     "name": "Hyderabad",
    //                     "province": "Sindh"
    //                 },
    //                 "rate": 1575
    //             },
    //             "available_seats": 4,
    //             "booked_seats": 0,
    //             "status": "AVAILABLE",
    //             "gender": "MALE",
    //             "date": "2023-04-09T09:00:00+05:00",
    //             "user": 1
    //         }
    ///
    // final utcDateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(data['date'], false);
    // var dateLocal = utcDateTime.toLocal();
    return Ride(
      id: data['id'],
      availableSeats: data['available_seats'],
      bookedSeats: data['booked_seats'],
      gender: data['gender'],
      route: CityRoute.fromMap(data['route']),
      car: Car.fromMap(data['car']),
      date: DateTime.parse(data['date']),
      pickupLocations: (data['pickup_locations'] as List<dynamic>)
          .map((e) => Location.fromMap(e))
          .toList(),
      dropOffLocations: (data['dropoff_locations'] as List<dynamic>)
          .map((e) => Location.fromMap(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'available_seats': availableSeats,
      'booked_seats': bookedSeats,
      'gender': gender,
      'from_city': route.fromCity.id,
      'to_city': route.toCity.id,
      'car': car.id,
      'date': DateFormat("yyyy-MM-dd HH:mm:ss").format(date.toUtc()),
      'pickup_location': pickupLocations.map((e) => {'address': e}).toList(),
      'dropoff_location': dropOffLocations.map((e) => {'address': e}).toList(),
    };
  }
}

class RideArguments {
  final int toCity;
  final int fromCity;
  final String date;

  RideArguments({required this.toCity, required this.fromCity, required this.date});
}
