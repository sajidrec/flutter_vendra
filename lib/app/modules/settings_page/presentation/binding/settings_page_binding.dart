import 'package:get/get.dart';
import 'package:vendra_app/app/modules/settings_page/presentation/controllers/settings_page_controller.dart';

class SettingsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsPageController());
  }
}
