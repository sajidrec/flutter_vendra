import 'package:get/get.dart';
import 'package:vendra_app/app/modules/buyer_profile_page/controllers/buyer_profile_page_controller.dart';

class BuyerProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuyerProfilePageController());
  }
}
