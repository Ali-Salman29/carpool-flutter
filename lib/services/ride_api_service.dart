import 'dart:convert';
import 'dart:developer';
import 'package:carpool/constants.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../models/ride.dart';

class BaseApiService {
  String? _token;

  Future<Map<String, dynamic>> getRequest(url) async {
    try{
      final response = await http.get(
          url,
          headers: ApiConstants.getBearerHeader(_token)
      );
      final jsonData = json.decode(response.body);
      if (response.statusCode == 200){
        return {'success': true, 'error': false, 'response': jsonData};
      }
      return {'success': false, 'error': false, 'response': jsonData};
    } catch (e) {
      log(e.toString());
      return {'success': false, 'error': true, 'message': e.toString()};
    }
  }

  Future<Map<String, dynamic>> postRequest(url, Map<String, dynamic> body) async {
    try{
      final response = await http.post(
          url,
          body: jsonEncode(body),
          headers: ApiConstants.getBearerHeader(_token)
      );
      final jsonData = json.decode(response.body);
      if (response.statusCode == 201){
        return {'success': true, 'error': false, 'response': jsonData};
      }
      return {'success': false, 'error': false, 'response': jsonData};
    } catch (e) {
      log(e.toString());
      return {'success': false, 'error': true, 'message': e.toString()};
    }
  }
}

class RideApiService extends BaseApiService{

  RideApiService(token){
    _token = token;
  }

  String localToUTCDate(String localTime) {
    return DateFormat('yyyy-MM-dd').format(DateTime.parse(localTime).toUtc());
  }

  Future<Map<String, dynamic>> fromCities(date) async {
    final Map<String, String> parameters = {
      'date' : localToUTCDate(date),
    };
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.rideCities, parameters);
    return await getRequest(url);
  }

  Future<Map<String, dynamic>> toCities(date, fromCity) async {
    final Map<String, String> parameters = {
      'date' : localToUTCDate(date),
      'from_city': fromCity.toString(),
    };
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.rideCities, parameters);
    return await getRequest(url);
  }

  Future<Map<String, dynamic>> rides(date, fromCity, toCity) async {
    final Map<String, String> parameters = {
      'date' : localToUTCDate(date),
      'to_city' : toCity.toString(),
      'from_city' : fromCity.toString(),
    };
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.rides, parameters);
    return await getRequest(url);
  }

  Future<Map<String, dynamic>> cars([int page=1]) async {
    final Map<String, String> parameters = {
      'page' : page.toString(),
    };
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.cars, parameters);
    return await getRequest(url);
  }

  Future<Map<String, dynamic>> cities([int page=1]) async {
    final Map<String, String> parameters = {
      'page' : page.toString(),
    };
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.allCities, parameters);
    return await getRequest(url);
  }

  Future<Map<String, dynamic>> addARide(Ride ride) async {
    final rideBody = ride.toMap();
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.rides);
    return await postRequest(url, rideBody);
  }

  Future<Map<String, dynamic>> addACar(Car car) async {
    final rideBody = car.toMap();
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.cars);
    return await postRequest(url, rideBody);
  }
}
