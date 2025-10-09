import 'package:get/get.dart';
import 'package:vendra_app/app/modules/on_boarding_page/controller/on_boarding_page_controller.dart';

class OnBoardingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingPageController(), fenix: true);
  }
}
