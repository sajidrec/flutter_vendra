import 'package:get/get.dart';
import 'package:vendra_app/app/modules/edit_profile_page/presentation/controllers/edit_profile_page_controller.dart';

class EditProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfilePageController());
  }
}
