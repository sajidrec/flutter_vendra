import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/data/models/auction_item_model.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/views/analytics_page.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/views/listings_page.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/views/overview_page.dart';

import '../views/messages_page.dart';

class SellerProfilePageController extends GetxController {
  List<String> navList = ["Overview", "Listings", "Analytics", "Messages"];
  List<Widget> pages = [
    OverViewPage(),
    ListingsPage(
      auctionItemModel: AuctionItemModel(
        id: "ABC",
        description: "custom description",
        highestBid: 12345,
        imgUrl: "https://cdn.mos.cms.futurecdn.net/yDn3ZSXu9eSBxmXQDZ4PCF.jpg",
        isFavourite: false,
        itemName: "I-phun",
        timeLeft: "2025-10-21T18:00:00Z",
        topBidders: [
          TopBidders(
            name: "Jackma",
            price: 999,
            profilePic:
                "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ),
          TopBidders(
            name: "Jack",
            price: 998,
            profilePic:
                "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ),
          TopBidders(
            name: "Jac",
            price: 997,
            profilePic:
                "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          ),
        ],
      ),
    ),
    AnalyticsPage(),
    MessagesPage(),
  ];

  int index = 0;

  void changeNavIndex({required int index}) {
    this.index = index;
    update();
  }
}
