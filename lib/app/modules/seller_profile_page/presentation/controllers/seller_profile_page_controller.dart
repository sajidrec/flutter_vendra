import 'package:get/get.dart';

class SellerProfilePageController extends GetxController {
  List<String> navList = ["Overview", "Listings", "Analytics", "Messages"];
  int navIndex = 0;

  void changeNavIndex({required int index}) {
    navIndex = index;
    update();
  }
}
