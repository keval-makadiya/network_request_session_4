import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:session_demo/handlers/api_client.dart';
import 'package:session_demo/models/login_resp.dart';

class DataHandler with ChangeNotifier {
  LoginResp _loginResp = LoginResp();

  LoginResp get loginResp => _loginResp;

  bool isProgress = false;

  Future<void> providerFetchData() async {
    isProgress = true;
    notifyListeners();
    var apiClient = ApiClient();
    var data = await apiClient.fetchUsers();
    if (data != null) {
      _loginResp = data;
    }
    log('data -> ${loginResp.toJson()}');
    await Future.delayed(const Duration(seconds: 3));
    isProgress = false;
    notifyListeners();
  }
}
