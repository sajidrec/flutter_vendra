import 'package:get/get.dart';
import 'package:vendra_app/app/modules/live_auction_details_page/presentation/controllers/live_auction_details_page_controller.dart';

class LiveAuctionDetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LiveAuctionDetailsPageController());
  }
}
