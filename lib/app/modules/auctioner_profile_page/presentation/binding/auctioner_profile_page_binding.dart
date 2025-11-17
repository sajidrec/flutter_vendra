import 'package:get/get.dart';
import 'package:vendra_app/app/modules/auctioner_profile_page/presentation/controllers/auctioner_profile_page_controller.dart';

class AuctionerProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuctionerProfilePageController(), fenix: true);
  }
}
