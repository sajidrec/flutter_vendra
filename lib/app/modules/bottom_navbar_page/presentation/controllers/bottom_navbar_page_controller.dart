import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/home_page/presentation/views/home_page.dart';

class BottomNavbarPageController extends GetxController {
  int index = 0;

  final List<Widget> pages = [
    HomePage(),
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
