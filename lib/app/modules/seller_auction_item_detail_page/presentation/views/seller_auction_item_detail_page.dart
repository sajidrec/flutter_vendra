import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/data/models/auction_item_model.dart';

class SellerAuctionItemDetailPage extends StatelessWidget {
  const SellerAuctionItemDetailPage({super.key, required this.auctionItemModel});

  final AuctionItemModel auctionItemModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Live auction"),
        backgroundColor: AppColors.primaryWhite,
        actions: [_buildMoreOptions()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  auctionItemModel.itemName ?? "",
                  style: TextStyle(fontSize: 17.sp),
                ),
                Text(
                  auctionItemModel.description ?? "",
                  style: TextStyle(fontSize: 13.sp),
                ),
                Text(
                  "Lot #${auctionItemModel.id}",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.primaryPurple,
                  ),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "£ ${auctionItemModel.highestBid}",
                      style: TextStyle(
                        fontSize: 34.sp,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      " Highest bid",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.primarySuccess,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryPurple.withAlpha(
                        (255 * .07).round(),
                      ),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          index == 0 ? Text("Top bidder") : SizedBox.shrink(),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                  auctionItemModel
                                          .topBidders![index]
                                          .profilePic ??
                                      "",
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    auctionItemModel.topBidders![index].name ??
                                        "",
                                    style: TextStyle(fontSize: 17.sp),
                                  ),
                                  Text(
                                    "${auctionItemModel.topBidders![index].price ?? 0.00}",
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 8.sp),
                  itemCount: auctionItemModel.topBidders!.length,
                ),

                SizedBox(height: 24.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Manage Bid Pricing",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Based on the bidders interest increase the next bid amount.",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.primaryBlack.withAlpha(
                          (255 * .8).round(),
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.primaryBlack.withAlpha(
                          (255 * .06).round(),
                        ),

                        prefixIcon: Icon(
                          Icons.currency_pound,
                          color: AppColors.primaryBlack,
                        ),

                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryPurple,
                              foregroundColor: AppColors.primaryWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Update price",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ),
                        ),

                        hintText: "Enter Amount",
                        hintStyle: TextStyle(
                          fontSize: 22.sp,
                          color: AppColors.primaryBlack.withAlpha(
                            (255 * .35).round(),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),

                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 75.h),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlack,
                      foregroundColor: AppColors.primaryWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    onPressed: () {
                      Get.dialog(
                        Center(
                          child: Container(
                            width: Get.width - 32,
                            decoration: BoxDecoration(
                              color: AppColors.primaryWhite,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.primaryWhite,
                              child: Padding(
                                padding: EdgeInsets.all(24.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Are you sure?",
                                      style: TextStyle(fontSize: 28.sp),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 12.sp),
                                      child: Text(
                                        "You want to declare the bid winner to Pristine Auction?",
                                        style: TextStyle(fontSize: 17.sp),
                                      ),
                                    ),

                                    Text(
                                      "With amount of",
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 24.sp),
                                      child: Text(
                                        "£980",
                                        style: TextStyle(fontSize: 36.sp),
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryBlack,
                                              foregroundColor:
                                                  AppColors.primaryWhite,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                            ),
                                            child: Text(
                                              "Yes, Confirm",
                                              style: TextStyle(fontSize: 17.sp),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryWhite,
                                              foregroundColor:
                                                  AppColors.primaryBlack,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                            ),
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(fontSize: 17.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Declare winner",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ),
                ),

                SizedBox(height: 12.h),

                Center(
                  child: Text(
                    "The buyer who called highest bid will be winner.",
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.primarySuccess,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconButton _buildMoreOptions() {
    return IconButton(
      onPressed: () {
        Get.bottomSheet(
          Container(
            height: 160.h,
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                topLeft: Radius.circular(10.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.walkingPersonIcon,
                        width: 24.w,
                        height: 24.h,
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Switch bid", style: TextStyle(fontSize: 17.sp)),
                          Text(
                            "Move to next live auction",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.primaryBlack.withAlpha(
                                (255 * .6).round(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.close,
                        color: AppColors.primaryDanger,
                        size: 24.sp,
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Cancel bid", style: TextStyle(fontSize: 17.sp)),
                          Text(
                            "Don’t want to sell the item",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.primaryBlack.withAlpha(
                                (255 * .6).round(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      icon: Icon(Icons.more_vert_outlined),
    );
  }
}
