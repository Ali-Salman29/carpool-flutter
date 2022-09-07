import 'dart:convert';
import 'dart:developer';
import 'package:carpool/constants.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

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
        return {'success': true, 'response': jsonData};
      }
      return {'success': false, 'response': jsonData};
    } catch (e) {
      log(e.toString());
      return {'error': e.toString()};
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
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.cities, parameters);
    return await getRequest(url);
  }

  Future<Map<String, dynamic>> toCities(date, fromCity) async {
    final Map<String, String> parameters = {
      'date' : localToUTCDate(date),
      'from_city': fromCity.toString(),
    };
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.cities, parameters);
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
}
