import 'package:get/get.dart';
import 'package:vendra_app/app/modules/home_page/presentation/controllers/home_page_controller.dart';

import '../controllers/bottom_navbar_page_controller.dart';

class BottomNavbarPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(fenix: true, () => BottomNavbarPageController());
    Get.lazyPut(fenix: true, () => HomePageController());
  }
}
