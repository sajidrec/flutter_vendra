import 'package:get/get.dart';
import 'package:vendra_app/app/modules/message_page/controllers/message_page_controller.dart';

class MessagePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessagePageController());
  }
}
