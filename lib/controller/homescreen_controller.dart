import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:glaregroup/view/screens/homescreen.dart';

import '../view/screens/home.dart';

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
        Center(child: Text("Settings"),)
      ],) ,
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: Text("Profile"),)
      ],) ,
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: Text("Favorite"),)
      ],) ,
  ];

  List titleBottomAppbar = [
    "Home",
    "Settings",
    "Profile",
    "Favorite"
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

}