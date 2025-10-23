import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/controller/become_seller_page_controller.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/views/become_seller_page.dart';
import 'package:vendra_app/app/modules/favorite_page/presentation/views/favorite_page.dart';
import 'package:vendra_app/app/modules/home_page/presentation/views/home_page.dart';
import 'package:vendra_app/app/modules/notification_page/presentation/views/notification_page.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/views/sell_page.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/views/seller_profile_page.dart';

import '../../../../core/data/models/auction_item_model.dart';

class BottomNavbarPageController extends GetxController {
  int index = 0;

  List<Widget> pages = [
    HomePage(
      auctionItemModel: AuctionItemModel(
        description: "Testing description",
        highestBid: 99,
        imgUrl: "https://img.freepik.com/free-vector/white-product-podium-with-green-tropical-palm-leaves-golden-round-arch-green-wall_87521-3023.jpg",
        isFavourite: false,
        itemName: "testProduct",
        timeLeft: DateTime.now().toString(),
        id: '1',
        topBidders: [
          TopBidders(
            profilePic: "https://png.pngtree.com/png-vector/20250321/ourmid/pngtree-wireless-headphone-png-image_15830312.png",
            price: 99,
            name: "Sajid",
          ),
          TopBidders(
            profilePic: "https://png.pngtree.com/png-vector/20250321/ourmid/pngtree-wireless-headphone-png-image_15830312.png",
            price: 99,
            name: "Sajid",
          ),
          TopBidders(
            profilePic: "https://png.pngtree.com/png-vector/20250321/ourmid/pngtree-wireless-headphone-png-image_15830312.png",
            price: 99,
            name: "Sajid",
          ),
        ],
      ),
    ),
     FavoritePage(),
    const BecomeSellerPage(),
    const NotificationPage(),
    const SellerProfilePage(),
    //   Change in both place
  ];

  void changePage(int index) {
    this.index = index;
    update();
  }

  @override
  void onInit() async {
    super.onInit();

    final becomeSellerController = Get.find<BecomeSellerPageController>();

    await Get.find<BecomeSellerPageController>().getVerifiedSellerStatus();

    bool isVerified = becomeSellerController.verifiedSeller;

    pages = [
      HomePage(
        auctionItemModel: AuctionItemModel(
          description: "Testing description",
          highestBid: 99,
          imgUrl: "https://img.freepik.com/free-vector/white-product-podium-with-green-tropical-palm-leaves-golden-round-arch-green-wall_87521-3023.jpg",
          isFavourite: false,
          itemName: "testProduct",
          timeLeft: DateTime.now().toString(),
          id: '1',
          topBidders: [
            TopBidders(
              profilePic:
                  "https://avatars.githubusercontent.com/u/69637820?v=4",
              price: 99,
              name: "Sajid",
            ),
            TopBidders(
              profilePic:
                  "https://avatars.githubusercontent.com/u/69637820?v=4",
              price: 99,
              name: "Sajid",
            ),
            TopBidders(
              profilePic:
                  "https://avatars.githubusercontent.com/u/69637820?v=4",
              price: 99,
              name: "Sajid",
            ),
          ],
        ),
      ),
       FavoritePage(),
      isVerified
          ? const SellPage() // show seller page if verified
          : const BecomeSellerPage(), // show become seller page otherwise
      const NotificationPage(),
      const SellerProfilePage(),
    ];
  }
}
