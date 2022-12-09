import 'package:flutter/material.dart';

class ManageBanner extends StatelessWidget {
  const ManageBanner({Key? key}) : super(key: key);
  static const String id = 'manage-banner';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('manage banner'),),
    );
  }
}
