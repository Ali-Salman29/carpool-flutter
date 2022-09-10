import 'package:carpool/services/ride_api_service.dart';

import '../constants.dart';
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
}
