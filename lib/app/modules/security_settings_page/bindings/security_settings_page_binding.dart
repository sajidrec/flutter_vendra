import 'package:get/get.dart';
import 'package:vendra_app/app/modules/security_settings_page/controllers/security_settings_page_controller.dart';

class SecuritySettingsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecuritySettingsPageController());
  }
}
