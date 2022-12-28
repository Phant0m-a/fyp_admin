import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../../widgets/sidebar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  static const String id = 'notificaion';
  @override
  Widget build(BuildContext context) {
    //
    SideBarWidget _sideBar = SideBarWidget();

    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Color(0xff944444),
        title: const Text('Grocery App Dashboard', style:TextStyle(color: Colors.white),),
      ),
      sideBar:SideBarWidget.sideBarMenu(context,NotificationScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Notification Screen',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}
