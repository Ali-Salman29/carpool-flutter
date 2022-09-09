import 'package:flutter/material.dart';

// Background Colors
const kBackgroundColor = Color(0xFF212121);
//App Colors
const kPrimaryColor = Color(0xFF00C861);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xFF00C861), Color(0xFF009347)],
);
const kSecondaryColor = Color(0xFF121212);

const kErrorColor = Color(0xFFEB3A40);

const kSelectedItemColor = Color(0xFF61F2A9);
const kIconColor = Color(0xFF9F9F9F);
//Text Settings
const kTextColor = Colors.white;
const kTextLightColor = Color(0xFFBEBEBE);

const kAnimationDuration = Duration(milliseconds: 200);

const carColors = [Color(0xFF39D374), Color(0xFFFFFFFF), Color(0xFF393FD3)];

class ApiConstants {
  static String baseUrl = 'http://10.0.2.2:8000';
  static String baseUrlWithoutHttp = '10.0.2.2:8000';
  static String login = '/auth/login';
  static String currentUser = '/auth/current_user';
  static String rideCities = '/rides/get_all_cities';
  static String allCities = '/cities';
  static String rides = '/rides/';
  static String cars = '/cars/';

  static Map<String, String> getBearerHeader(token){
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  static Map<String, String> getHeader(){
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
}
