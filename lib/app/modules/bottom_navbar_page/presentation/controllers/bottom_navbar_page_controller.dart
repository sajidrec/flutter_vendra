import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/controller/become_seller_page_controller.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/views/become_seller_page.dart';
import 'package:vendra_app/app/modules/home_page/presentation/views/home_page.dart';
import 'package:vendra_app/app/modules/notification_page/presentation/views/notification_page.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/views/sell_page.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/views/seller_profile_page.dart';

class BottomNavbarPageController extends GetxController {
  int index = 0;

  List<Widget> pages = [
    const HomePage(),
    const Center(child: Text("Favorite")),
    const BecomeSellerPage(),
    const NotificationPage(),
    const SellerProfilePage(),
    //   Change in both place
  ];

  void changePage(int index) {
    this.index = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();

    final becomeSellerController = Get.find<BecomeSellerPageController>();

    await Get.find<BecomeSellerPageController>().getVerifiedSellerStatus();

    bool isVerified = becomeSellerController.verifiedSeller;

    pages = [
      const HomePage(),
      const Center(child: Text("Favorite")),
      isVerified
          ? const SellPage() // show seller page if verified
          : const BecomeSellerPage(), // show become seller page otherwise
      const NotificationPage(),
      const SellerProfilePage(),
    ];
  }
}
