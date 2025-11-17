import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/auctioner_profile_page/presentation/views/about.dart';
import 'package:vendra_app/app/modules/auctioner_profile_page/presentation/views/items_list.dart';

class AuctionerProfilePageController extends GetxController {
  int index = 0;

  List<String> navList = ["Items", "About"];
  List<Widget> pages = [ItemsList(), About()];

  void changeNavIndex({required int index}) {
    this.index = index;
    update();
  }
}
