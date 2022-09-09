import 'package:carpool/constants.dart';
import 'package:intl/intl.dart';
import '../models/ride.dart';
import 'base_api_service.dart';


class RideApiService extends BaseApiService{

  RideApiService(userToken){
    token = userToken;
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
