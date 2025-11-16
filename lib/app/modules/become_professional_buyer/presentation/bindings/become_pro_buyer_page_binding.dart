import 'package:get/get.dart';
import 'package:vendra_app/app/modules/become_professional_buyer/presentation/controllers/become_pro_buyer_page_controller.dart';

class BecomeProBuyerPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BecomeProBuyerPageController());
  }
}
