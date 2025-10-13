import 'package:get/get.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/controller/become_seller_step_page_controller.dart';

class BecomeSellerStepPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BecomeSellerStepPageController(),fenix: true);
  }

}