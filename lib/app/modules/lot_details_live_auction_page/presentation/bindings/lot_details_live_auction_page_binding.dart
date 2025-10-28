import 'package:get/get.dart';

import '../controllers/lot_details_live_auction_page_controller.dart';

class LotDetailsLiveAuctionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(fenix: true, () => LotDetailsLiveAuctionPageController());
  }
}
