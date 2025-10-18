import 'package:get/get.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/controller/become_seller_page_controller.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/controller/become_seller_step_page_controller.dart';
import 'package:vendra_app/app/modules/home_page/presentation/controllers/home_page_controller.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/controllers/sell_page_controller.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/controllers/tag_page_controller.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/views/seller_profile_page.dart';

import '../controllers/bottom_navbar_page_controller.dart';

class BottomNavbarPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(fenix: true, () => BottomNavbarPageController());
    Get.lazyPut(fenix: true, () => HomePageController());
    Get.lazyPut(fenix: true, () => BecomeSellerPageController());
    Get.lazyPut(fenix: true, () => BecomeSellerStepPageController());
    Get.lazyPut(fenix: true, () => SellPageController());
    Get.lazyPut(fenix: true, () => TagPageController());
    Get.lazyPut(fenix: true, () => SellerProfilePage());
  }
}
