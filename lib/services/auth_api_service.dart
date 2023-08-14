import 'package:firebase_messaging/firebase_messaging.dart';

import '../constants.dart';
import '../models/user.dart';
import 'base_api_service.dart';

class AuthApiService extends BaseApiService {

  AuthApiService(userToken){
    token = userToken;
  }

  Future<Map<String, dynamic>> signIn(String username, String password) async {
    final body = {'username': username, 'password': password};
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.login);
    return await postRequest(url, body, false);
  }

  Future<Map<String, dynamic>> registerUser(User user) async {
    final body = user.toMap();
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.register);
    return await postRequest(url, body, false);
  }

  Future<Map<String, dynamic>> registerFCMToken() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    // TODO: PASS Device info
    final Map<String, dynamic> body = {
      "registration_id": fcmToken,
      "cloud_message_type": "FCM",
      "name": "Rider Device"
    };
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.gcm);
    return await postRequest(url, body, true);
  }

  Future<Map<String, dynamic>> currentUser() async {
    await registerFCMToken();
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.currentUser);
    return await getRequest(url);
  }

  Future<Map<String, dynamic>> logout() async {
    final url = Uri.http(ApiConstants.baseUrlWithoutHttp, ApiConstants.logout);
    return await getRequest(url);
  }
}
