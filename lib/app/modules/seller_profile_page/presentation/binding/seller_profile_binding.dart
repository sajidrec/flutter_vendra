import 'package:get/get.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/controllers/seller_profile_page_controller.dart';

class SellerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(fenix: true, () => SellerProfilePageController());
  }
}
