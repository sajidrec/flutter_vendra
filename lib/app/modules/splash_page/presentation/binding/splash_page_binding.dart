import 'package:get/get.dart';
import 'package:vendra_app/app/modules/splash_page/presentation/controllers/splash_page_controller.dart';

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashPageController());
  }
}
