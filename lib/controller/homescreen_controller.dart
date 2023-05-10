import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glaregroup/view/screens/homescreen.dart';
import 'package:glaregroup/view/screens/notificationscreen.dart';
import 'package:glaregroup/view/screens/offersscreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:glaregroup/view/screens/settings.dart';

abstract class HomeScreenController extends GetxController{

  changePage(int currentpage);

}

class HomeScreenControllerImp extends HomeScreenController{

  int currentpage =0;

  List<Widget> listPage = [
    const HomeScreen(),
    const NotificationScreen(),
    const OffersScreen(),
    const SettingScreen()
  ];

  List bottomAppbar = [
    {
      "title" : "Home",
      "icon" : EvaIcons.home
    },
    {
      "title" : "Notifications",
      "icon" : EvaIcons.bellOutline
    },
    {
      "title" : "Offers",
      "icon" : EvaIcons.flash
    },
    {
      "title" : "Settings",
      "icon" : EvaIcons.settings
    },

  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

}