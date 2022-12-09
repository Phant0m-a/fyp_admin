import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:fypadmin/views/banner/manage_banner.dart';
import 'package:fypadmin/views/categories/category_screen.dart';
import 'package:fypadmin/views/home/home.dart';
import 'package:fypadmin/views/login/login.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fypadmin/views/order/order_screen.dart';
import 'package:fypadmin/views/splash_screen/splash_screen.dart';
import 'constants/style.dart';
import 'views/admin/admin_screen.dart';
import 'views/notification/notification_screen.dart';
import 'views/settings/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
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
      home: const SplashScreen(),
      routes: {
        HomeScreen.id:(context) => const HomeScreen(),
        SplashScreen.id:(context) => const SplashScreen(),
        Login.id: (context) => const Login(),
        ManageBanner.id: (context) => const ManageBanner(),
        CategoryScreen.id: (context) => const CategoryScreen(),
        OrderScreen.id: (context) => const OrderScreen(),
        NotificationScreen.id: (context) => const NotificationScreen(),
        AdminScreen.id: (context) => const AdminScreen(),
        SettingsScreen.id: (context) => const SettingsScreen(),
      },
    );
  }
}
