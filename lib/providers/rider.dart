import 'package:carpool/services/ride_api_service.dart';
import 'package:flutter/material.dart';

import '../models/ride.dart';

class Rider with ChangeNotifier {
  final String? _token;
  Ride? _ride;
  List<City> _cities = [];
  List<Car> _cars = [];
  bool _areCitiesLoaded = false;
  bool _areCarsLoaded = false;

  Rider(this._token, this._ride, this._cities, this._cars);

  List<Car> get cars{
    return [..._cars];
  }

  Ride? get rider{
    return _ride;
  }

  List<City> get cities{
    return [..._cities];
  }

  bool get isLoaded{
    return _areCarsLoaded || _areCitiesLoaded;
  }

  Future<void> getCars() async {
    final List<Car> cars = [];
    int page = 0;
    Map<String, dynamic> response;
    do {
      response = await RideApiService(_token).cars(page+1);
      if (response['success']) {
        List<dynamic> jsonCars = response['response']['results'];
        cars.addAll(jsonCars.map((e) => Car.fromMap(e as Map<String, dynamic>)).toList());
        page += 1;
      }
    } while(response['success'] && response['response']['next'] != null);
    _cars = cars;
    _areCarsLoaded = true;
    notifyListeners();
  }

  Future<void> getCities() async {
    final List<City> cities = [];
    int page = 0;
    Map<String, dynamic> response;
    do {
      response = await RideApiService(_token).cities(page+1);
      if (response['success']) {
        List<dynamic> jsonCities = response['response']['results'];
        cities.addAll(jsonCities.map((e) => City.fromMap(e as Map<String, dynamic>)).toList());
        page += 1;
      }
    } while(response['success'] && response['response']['next'] != null);
    _cities = cities;
    _areCitiesLoaded = true;
    notifyListeners();
  }

  Future<void> addACar(Car car) async {
    final response = await RideApiService(_token).addACar(car);
    if (response['success']) {
      final cars = [..._cars];
      final car = Car.fromMap(response['response'] as Map<String, dynamic>);
      cars.insert(0, car);
      _cars = cars;
      notifyListeners();
    }
  }
}
