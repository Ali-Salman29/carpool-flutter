import 'package:carpool/services/auth_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class Auth with ChangeNotifier {
  String? _token;
  User? _user;

  String? get userToken {
    return _token;
  }

  Future<void> deleteTokenToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  Future<void> storeTokenToLocalStorage(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getTokenFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // Future<Map<String, dynamic>> getOrCreateFCMToken() {
  //   return await AuthApiService(_token).registerFCMToken();
  // }

  Future<Map<String, dynamic>> signIn(String username, String password) async {
    final response = await AuthApiService(_token).signIn(username, password);
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

  Future<Map<String, dynamic>> register(User user) async {
    final response = await AuthApiService(_token).registerUser(user);
    print(response);
    if (response['success']){
      return {'status': true };
    } else if (!response['success']) {
      return {'status': false, 'validations': response['response']};
    } else {
      return {'status': false, 'error': response['message']};
    }
  }

  Future<Map<String, dynamic>> logout() async {
    final response = await AuthApiService(_token).logout();
    if (response['success']){
      await deleteTokenToLocalStorage();
      _token = null;
      _user = null;
      notifyListeners();
      return {'status': true };
    } else {
      return {'status': false};
    }
  }

  Future<User?> getCurrentUser() async {
    if (_user != null) {
      return _user!;
    }
    _token ??= await getTokenFromLocalStorage();
    if (_token != null) {
      final response = await AuthApiService(_token).currentUser();
      if (response['success']) {
        final jsonData = response['response'];
        _user = User.fromMap(jsonData['user']);
        _token = jsonData['token'];
      } else {
        _token = null;
        _user = null;
      }
    }
    return _user;
  }
}
