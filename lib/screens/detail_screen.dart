// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:session_demo/models/login_resp.dart';

class DetailScreen extends StatelessWidget {
  final Data data;

  DetailScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //TODO: back press event
            Navigator.pop(context);
          },
        ),
        title: Text('Detail screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _customText(data.firstName ?? 'first name'),
            _customText(data.lastName ?? 'last name'),
            _customText(data.email ?? 'email'),
          ],
        ),
      ),
    );
  }

  Widget _customText(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
