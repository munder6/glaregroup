import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/view/screens/homescreen.dart';

import '../view/screens/home.dart';
import '../view/screens/settings.dart';

abstract class HomeScreenController extends GetxController{

  changePage(int currentpage);

}

class HomeScreenControllerImp extends HomeScreenController{

  int currentpage =0;

  List<Widget> listPage = [
    const HomeScreen(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: Text("Notifications"),)
      ],) ,
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: Text("Profile"),)
      ],) ,
    SettingScreen()
  ];

  List bottomAppbar = [
    {
      "title" : "Home",
      "icon" : Icons.home
    },
    {
      "title" : "Notifications",
      "icon" : Icons.notifications_active_outlined
    },
    {
      "title" : "Profile",
      "icon" : Icons.person
    },
    {
      "title" : "Settings",
      "icon" : Icons.settings
    },

  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

}