import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:session_demo/models/login_resp.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class SharedPref {
  final _sharedPref = SharedPreferences.getInstance();

  Future storeUserData(Map data) async {
    final pref = await _sharedPref;
    var encodedData = jsonEncode(data);
    await pref.setString('userData', encodedData);
  }

  dynamic getUserData() async {
    final pref = await _sharedPref;
    var data = pref.getString('userData');
    log('data -> $data');
    if (data != null) {
      return LoginResp.fromJson(jsonDecode(data));
    }
  }
}
