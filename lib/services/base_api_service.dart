import 'dart:convert';
import 'dart:developer';
import 'package:carpool/constants.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;




class BaseApiService {
  String? token;

  Future<Map<String, dynamic>> getRequest(url) async {
    try{
      final response = await http.get(
          url,
          headers: ApiConstants.getBearerHeader(token)
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

  Future<Map<String, dynamic>> postRequest(url, Map<String, dynamic> body, [acceptWithToken=true]) async {
    try{
      final response = await http.post(
          url,
          body: jsonEncode(body),
          headers: acceptWithToken ?
          ApiConstants.getBearerHeader(token):
          ApiConstants.getHeader()
      );
      final jsonData = json.decode(response.body);
      if (response.statusCode == 201 && response.statusCode == 200){
        return {'success': true, 'error': false, 'response': jsonData};
      }
      return {'success': false, 'error': false, 'response': jsonData};
    } catch (e) {
      log(e.toString());
      return {'success': false, 'error': true, 'message': e.toString()};
    }
  }
}