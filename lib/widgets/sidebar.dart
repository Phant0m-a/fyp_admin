


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../views/admin/admin_screen.dart';
import '../views/banner/manage_banner.dart';
import '../views/categories/category_screen.dart';
import '../views/home/home.dart';
import '../views/login/login.dart';
import '../views/notification/notification_screen.dart';
import '../views/order/order_screen.dart';
import '../views/settings/settings_screen.dart';

class SideBarWidget{
  static sideBarMenu(context, selectedRoute){
    return SideBar(
      items: const [
        AdminMenuItem(
          title: 'Dashboard',
          route: HomeScreen.id,
          icon: Icons.dashboard,
        ),

        AdminMenuItem(
          title: 'Banners',
          route: ManageBanner.id,
          icon: CupertinoIcons.photo,
        ),

        AdminMenuItem(
          title: 'Categories',
          route: CategoryScreen.id,
          icon: Icons.category,
        ),

        AdminMenuItem(
          title: 'Orders',
          route: OrderScreen.id,
          icon: CupertinoIcons.cart_fill,
        ),

        AdminMenuItem(
          title: 'Send Notification',
          route: NotificationScreen.id,
          icon: Icons.notifications,
        ),


        AdminMenuItem(
          title: 'Admin Users',

          route: AdminScreen.id,
          icon: Icons.person,
        ),

        AdminMenuItem(
          title: 'Settings',
          route:SettingsScreen.id,
          icon: Icons.settings,
        ),

        AdminMenuItem(
          title: 'Exit',
          route: Login.id,
          icon: Icons.exit_to_app_rounded,
        ),

        // AdminMenuItem(
        //   title: 'Top Level',
        //   icon: Icons.file_copy,
        //   children: [
        //     AdminMenuItem(
        //       title: 'Second Level Item 1',
        //       route: '/secondLevelItem1',
        //     ),
        //     AdminMenuItem(
        //       title: 'Second Level Item 2',
        //       route: '/secondLevelItem2',
        //     ),
        //     AdminMenuItem(
        //       title: 'Third Level',
        //       children: [
        //         AdminMenuItem(
        //           title: 'Third Level Item 1',
        //           route: '/thirdLevelItem1',
        //         ),
        //         AdminMenuItem(
        //           title: 'Third Level Item 2',
        //           route: '/thirdLevelItem2',
        //         ),
        //       ],
        //     ),
        //   ],
        // ),

      ],
      selectedRoute:selectedRoute,
      onSelected: (item) {
        if (item.route != null) {
          Navigator.of(context).pushNamed(item.route!);
        }
      },
      header: Container(
        height: 50,
        width: double.infinity,
        color: const Color(0xff444444),
        child: const Center(
          child: Text(
            'Menu',
            style: TextStyle(
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
        ),
      ),
      footer: Container(
        height: 50,
        width: double.infinity,
        color: const Color(0xff444444),
        child:  Center(
          child: Image.asset('assets/apple-logo.png',height: 30,) ,
        ),
      ),
    );
  }
}