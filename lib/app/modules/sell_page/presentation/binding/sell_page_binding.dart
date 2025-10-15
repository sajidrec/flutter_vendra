import 'package:get/get.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/controllers/sell_page_controller.dart';

class SellPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SellPageController());
  }
}
