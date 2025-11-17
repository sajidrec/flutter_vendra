import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/data/models/lot_details_model.dart';
import '../../../../routes/app_routes.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // number of columns
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 0.60, // width/height ratio of each item
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(
              AppRoutes.lotDetailsTimeAuctionPage,
              arguments: LotDetailsModel(
                color: "Red",
                highestBid: 999,
                isFavourite: true,
                timeLeft: DateTime.now().toString(),
                description: "Testing description",
                size: "XXL",
                condition: "New",
                deliveryAvailableIn: ["USA", "UK", "BD"],
                isLive: false,
                joinLiveAuction: null,
                title: "Headphone",
                subtitle: "Classic headphone",
                lotImages: [
                  "https://png.pngtree.com/png-vector/20250124/ourmid/pngtree-a-red-headphone-png-image_15320037.png",
                  "https://png.pngtree.com/png-vector/20250124/ourmid/pngtree-a-red-headphone-png-image_15320037.png",
                  "https://png.pngtree.com/png-vector/20250124/ourmid/pngtree-a-red-headphone-png-image_15320037.png",
                ],
                sellerProfile: SellerProfile(
                  name: "sajid",
                  followerList: ["user01"],
                  id: "unique01",
                  messageList: ["user01"],
                ),
                thumbnail:
                    "https://png.pngtree.com/png-vector/20250124/ourmid/pngtree-a-red-headphone-png-image_15320037.png",
                totalBids: 5,
                startingPrice: 75,
                specialFeature: "Nothing",
              ).toJson(),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryBorderColor, width: 1),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        width: double.infinity,
                        height: 130.h,
                        AppAssets.headPhoneImage,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            AppAssets.heartOutlineIcon,
                            width: 20.w,
                            height: 20.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    // widget.auctionItemModel.itemName ?? "",
                    "Name",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    // widget.auctionItemModel.description ?? "",
                    "Description",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    // "Starting at £${widget.auctionItemModel.highestBid}",
                    "Starting at £75",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.timerIcon),
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                          // "${widget.auctionItemModel.timeLeft} sec left",
                          "55 sec left",
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
