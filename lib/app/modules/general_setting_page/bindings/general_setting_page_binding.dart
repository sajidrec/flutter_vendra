import 'package:get/get.dart';
import 'package:vendra_app/app/modules/general_setting_page/controllers/general_setting_page_controller.dart';

class GeneralSettingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GeneralSettingPageController());
  }
}
