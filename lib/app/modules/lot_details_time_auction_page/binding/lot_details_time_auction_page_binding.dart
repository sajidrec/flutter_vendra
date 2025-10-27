import 'package:get/get.dart';
import 'package:vendra_app/app/modules/lot_details_time_auction_page/controllers/lot_details_time_auction_page_controller.dart';

class LotDetailsTimeAuctionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LotDetailsTimeAuctionPageController(), fenix: true);
  }
}
