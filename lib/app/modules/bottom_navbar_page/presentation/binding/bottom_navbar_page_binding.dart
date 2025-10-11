import 'package:get/get.dart';

import '../controllers/bottom_navbar_page_controller.dart';

class BottomNavbarPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(fenix: true, () => BottomNavbarPageController());
  }
}
