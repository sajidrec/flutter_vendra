import 'package:get/get.dart';
import 'package:vendra_app/app/modules/payment_method_page/controllers/payment_method_page_controller.dart';

class PaymentMethodPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodPageController(), fenix: true);
  }
}
