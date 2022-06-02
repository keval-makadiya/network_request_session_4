// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_demo/data_handler.dart';
import 'package:session_demo/screens/user_list_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataHandler(),
        ),
      ],
      child: MaterialApp(
        home: Myapp(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UserListScreen();
  }
}
