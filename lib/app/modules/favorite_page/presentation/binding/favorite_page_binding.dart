import 'package:get/get.dart';
import 'package:vendra_app/app/modules/favorite_page/presentation/controller/favorite_page_controller.dart';

class FavoritePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(fenix: true, () => FavoritePageController());
  }
}
