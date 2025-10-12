import 'package:get/get.dart';
import 'package:vendra_app/app/modules/auth/login_page/presentation/controller/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }
}
