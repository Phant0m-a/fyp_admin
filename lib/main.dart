import 'package:flutter/material.dart';
import 'package:fypadmin/views/login/login.dart';

import 'constants/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FYP Admin ',
      theme: ThemeData(
        primarySwatch: Palette.myColors,
      ),
      home:  Login(),
    );
  }
}
