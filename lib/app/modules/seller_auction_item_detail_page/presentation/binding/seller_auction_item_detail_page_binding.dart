import 'package:get/get.dart';

import '../controllers/seller_auction_item_detail_page_controller.dart';

class SellerAuctionItemDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SellerAuctionItemDetailPageController());
  }
}
