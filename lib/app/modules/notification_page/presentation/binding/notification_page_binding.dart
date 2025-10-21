import 'package:get/get.dart';
import 'package:vendra_app/app/modules/notification_page/presentation/controller/notification_page_controller.dart';

class NotificationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationPageController(), fenix: true);
  }
}
