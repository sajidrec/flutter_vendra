import 'package:get/get.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/controller/become_seller_page_controller.dart';

class BecomeSellerPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(fenix: true, () => BecomeSellerPageController());
  }
}
