import 'package:get/get.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/controllers/tag_page_controller.dart';

class TagPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TagPageController(), fenix: true);
  }
}
