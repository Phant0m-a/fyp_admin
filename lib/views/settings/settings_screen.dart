import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../../widgets/sidebar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String id = 'settings';
  @override
  Widget build(BuildContext context) {
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
      sideBar:SideBarWidget.sideBarMenu(context,SettingsScreen.id),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Settings Screen',
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
