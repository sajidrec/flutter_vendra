import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/data/models/auction_item_model.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

class ListingsPage extends StatelessWidget {
  const ListingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 332.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Stack(
          children: [
            SizedBox(
              width: 175.w,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.liveAuctionDetailsRoute,
                    arguments: AuctionItemModel(
                      id: index.toString(),
                      description: "custom description",
                      highestBid: 12345,
                      imgUrl: "",
                      isFavourite: false,
                      itemName: "I-phun",
                      timeLeft: "",
                      topBidders: [
                        TopBidders(name: "Jackma", price: 999, profilePic: ""),
                        TopBidders(name: "Jack", price: 998, profilePic: ""),
                        TopBidders(name: "Jac", price: 997, profilePic: ""),
                      ],
                    ).toJson(),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: CachedNetworkImage(
                            height: 142.h,
                            fit: BoxFit.cover,
                            imageUrl:
                                "https://static.vecteezy.com/system/resources/thumbnails/012/981/082/small_2x/wireless-headphones-side-view-white-icon-on-a-transparent-background-3d-rendering-png.png",
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Text(
                          "Apple".toUpperCase(),
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Noise-Canceling Wireless Headphone",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "Starting at £130",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.timerIcon),
                            Text(
                              "00d:05h:22 sec left",
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      height: 170.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryWhite,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6.r),
                          topRight: Radius.circular(6.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildEditListingItem(),
                            Divider(thickness: 1),
                            _buildDeleteListingItem(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.more_vert_outlined),
              ),
            ),
          ],
        ),
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemCount: 12,
      ),
    );
  }

  GestureDetector _buildEditListingItem() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.lotDetailsRoute,
          arguments: {"shouldWrapWithScaffold": true},
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.edit_outlined, color: AppColors.primaryPurple, size: 28),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Edit", style: TextStyle(fontSize: 17.sp)),
              Text(
                "Edit your listing information timeline and more",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack.withAlpha((255 * .6).round()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector _buildDeleteListingItem() {
    return GestureDetector(
      onTap: () {
        Get.dialog(
          Center(
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          color: AppColors.primaryDanger,
                        ),
                        Text(
                          "Delete item",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.primaryDanger,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    Divider(),
                    Wrap(
                      children: [
                        Text(
                          "Are you sure you want to delete the item from your listing? ",
                          style: TextStyle(fontSize: 17.sp),
                        ),
                        Text(
                          "Once you delete the item it will remove permanently from your listing ",
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: AppColors.primaryDanger,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlack,
                              foregroundColor: AppColors.primaryWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            child: Text("No, keep it"),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryDanger,
                              foregroundColor: AppColors.primaryWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            child: Text("Yes, delete"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.delete_outline, color: AppColors.primaryDanger, size: 28),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Delete", style: TextStyle(fontSize: 17.sp)),
              Text(
                "Remove the item permanently from your listing",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack.withAlpha((255 * .6).round()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
