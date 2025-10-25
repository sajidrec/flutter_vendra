import 'package:get/get.dart';
import 'package:vendra_app/app/modules/payment_method_page/controllers/add_card_page_controller.dart';

class AddCardPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCardPageController(), fenix: true);
  }
}
