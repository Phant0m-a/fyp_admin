import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fypadmin/views/login/login.dart';

import 'constants/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyALw_pCtipcUlsF82vtm8GSaUTqcwobnw8",
    appId: "1:525783945034:web:50f742f52c08f6dc6afbb3",
    messagingSenderId: "525783945034",
    projectId: "mobileandweb-344d0",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // start
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FYP Admin ',
      theme: ThemeData(
        primarySwatch: Palette.myColors,
      ),
      home: const Login(),
    );
  }
}
