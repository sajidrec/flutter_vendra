import 'package:get/get.dart';
import 'package:vendra_app/app/modules/auth/forget_pass_page/controllers/forget_pass_page_controller.dart';

class ForgetPassPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPassPageController());
  }
}
