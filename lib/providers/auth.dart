import 'dart:convert';
import 'dart:developer';
import 'package:carpool/constants.dart';
import 'package:carpool/services/auth_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class Auth with ChangeNotifier {
  String? _token;
  User? _user;

  String? get userToken {
    return _token;
  }

  Future<void> storeTokenToLocalStorage(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getTokenFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<Map<String, dynamic>> signIn(String username, String password) async {
    final response = await AuthApiService(_token).signIn(username, password);
    print(response);
    print("salman");
    if (response['success']) {
      final Map<String, dynamic> jsonData = response['response'];
      _token = jsonData['token'];
      _user = User.fromMap(jsonData['user'] as Map<String, dynamic>);
      storeTokenToLocalStorage(_token!);
      notifyListeners();
      return {'status': true, 'message': 'Successful'};
    } else if (response['success'] == false && response["error"] == false) {
      var errorData = '';
      final Map<String, dynamic> jsonData = response['response'];
      var validationData = {};
      if (jsonData.containsKey('non_field_errors')) {
        errorData = jsonData['non_field_errors'][0];
      } else {
        validationData = jsonData;
      }
      return {
        'status': false,
        'message': errorData,
        'validations': validationData
      };
    } else {
      return {'status': false, 'message': response['message']};
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      if (_user != null) {
        return _user!;
      }
      _token ??= await getTokenFromLocalStorage();
      if (_token != null) {
        var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.currentUser);
        final response =
            await http.get(url, headers: ApiConstants.getBearerHeader(_token));
        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          _user = User.fromMap(jsonData['user']);
          _token = jsonData['token'];
        } else {
          _token = null;
          _user = null;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return _user;
  }
}
