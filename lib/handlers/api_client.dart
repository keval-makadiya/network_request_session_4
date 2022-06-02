import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:session_demo/models/login_resp.dart';

class ApiClient {
  final _dio = Dio();

  dynamic fetchUsers() async {
    var response = await _dio.get('https://reqres.in/api/users?page=1');
    if (response.statusCode == 200) {
      return LoginResp.fromJson(response.data);
    } else {
      log('api err -> ${response.statusCode} -> ${response.statusMessage}');
      return null;
    }
  }
}
