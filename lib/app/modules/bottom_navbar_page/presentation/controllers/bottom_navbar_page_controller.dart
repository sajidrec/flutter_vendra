import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BottomNavbarPageController extends GetxController {
  int index = 0;

  final List<Widget> pages = [
    Center(child: Text("Home")),
    Center(child: Text("Favorite")),
    Center(child: Text("Sell")),
    Center(child: Text("Notification")),
    Center(child: Text("Me")),
  ];


  void changePage(int index) {
    this.index = index;
    update();
  }
}
