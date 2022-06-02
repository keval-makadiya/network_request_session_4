// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_demo/data_handler.dart';
import 'package:session_demo/handlers/api_client.dart';
import 'package:session_demo/models/login_resp.dart';
import 'package:session_demo/screens/detail_screen.dart';

class UserListScreen extends StatelessWidget {
  var loginResp = LoginResp();

  bool isLoading = false;

  var preference = SharedPref();

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<DataHandler>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List Screen'),
        actions: [
          IconButton(
            onPressed: () {
              // _parseData();
              _provider.providerFetchData();
            },
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: SafeArea(
        // ignore: prefer_const_constructors
        minimum: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    loginResp = LoginResp();
                    // setState(() {});
                  },
                  child: Text('Clear List '),
                ),
                ElevatedButton(
                  onPressed: () {
                    // _saveDataToLocal();
                  },
                  child: Text('Save to Local'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // _retrieveDataFromLocal();
                  },
                  child: Text('Retrieve From Local'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ChangeNotifierProvider(
              create: (ctx) => DataHandler(),
              child: !context.watch<DataHandler>().isProgress
                  ? ListView.builder(
                      shrinkWrap: true,
                      // itemCount: loginResp.data?.length ?? 0,
                      itemCount: _provider.loginResp.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        var obj = _provider.loginResp.data![index];
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailScreen(data: obj),
                                ),
                              );
                            },
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(obj.avatar ?? ''),
                            ),
                            title: Text(obj.firstName ?? ''),
                            subtitle: Text(obj.email ?? ''),
                          ),
                        );
                      },
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }

  // _saveDataToLocal() async {
  //   await preference.storeUserData(loginResp.toJson());
  //   loginResp = LoginResp();
  //   setState(() {});
  // }
  //
  // _retrieveDataFromLocal() async {
  //   loginResp = await preference.getUserData();
  //   setState(() {});
  // }
  //
  // Future<void> _parseData() async {
  //   var apiClient = ApiClient();
  //   var data = await apiClient.fetchUsers();
  //   if (data != null) {
  //     loginResp = data;
  //   }
  //   log('data -> ${loginResp.toJson()}');
  //   setState(() {});
  // }
}
