import 'dart:convert';
import 'dart:developer';

import 'package:session_demo/models/login_resp.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
