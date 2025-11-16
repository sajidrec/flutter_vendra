import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/buyer_profile_page/views/activity_page.dart';
import 'package:vendra_app/app/modules/buyer_profile_page/views/reciept_page.dart';

class BuyerProfilePageController extends GetxController {
  bool editMode = false;
  int index = 0;

  List<String> navList = ["Activity", "Reciept", "Messages"];

  List<Widget> pages = [ActivityPage(), RecieptPage()];

  void changeNavIndex({required int index}) {
    this.index = index;
    update();
  }

  void toggleEditMode() {
    editMode = !editMode;
    update();
  }
}
