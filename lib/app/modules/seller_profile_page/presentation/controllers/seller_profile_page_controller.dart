import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/views/listings_page.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/views/overview_page.dart';

class SellerProfilePageController extends GetxController {
  List<String> navList = ["Overview", "Listings", "Analytics", "Messages"];
  List<Widget> pages = [OverViewPage(), ListingsPage()];

  int index = 0;

  void changeNavIndex({required int index}) {
    this.index = index;
    update();
  }
}
