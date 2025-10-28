import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/core/data/models/lot_details_model.dart';
import 'package:vendra_app/app/global_widgets/dot_slider_widget.dart';
import 'package:vendra_app/app/modules/lot_details_time_auction_page/controllers/lot_details_time_auction_page_controller.dart';

import '../widgets/custom_expantion_widget.dart';

class LotDetailsTimeAuctionPage extends StatelessWidget {
  const LotDetailsTimeAuctionPage({super.key, required this.lotDetailsModel});

  final LotDetailsModel lotDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryWhite),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 70.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // Align both vertically
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // Center items vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Align text left
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.primaryBlack.withAlpha(
                          (255 * .6).round(),
                        ),
                      ),
                    ),
                    Text(
                      "£350",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: SizedBox(
                    height: 46.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.dialog(
                          Dialog(
                            backgroundColor: AppColors.primaryWhite,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(20.sp),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Are you sure?",
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryBlack,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    "You about to enter the bidding. Single click bidding will be enabled.",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      height: 1.4,
                                      color: AppColors.primaryBlack.withOpacity(
                                        .7,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 18.h),

                                  Text(
                                    "Bid Amount",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryBlack.withOpacity(
                                        .6,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    "£300",
                                    style: TextStyle(
                                      fontSize: 26.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryBlack,
                                    ),
                                  ),

                                  SizedBox(height: 22.h),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Get.back(); // Confirm Action
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.primaryBlack,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                            ),
                                          ),
                                          child: Text(
                                            "Yes, Confirm",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      TextButton(
                                        onPressed: () => Get.back(), // Cancel
                                        child: Text(
                                          "CANCEL",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.primaryBlack
                                                .withOpacity(.8),
                                          ),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlack,
                        foregroundColor: AppColors.primaryWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      child: Text(
                        "Request to Bid",
                        style: TextStyle(fontSize: 17.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<LotDetailsTimeAuctionPageController>(
            builder: (controller) {
              return Column(
                children: [
                  CarouselSlider(
                    items: lotDetailsModel.lotImages!
                        .map(
                          (imgUrl) => SizedBox(
                            width: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: imgUrl,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: AppColors.primaryDanger,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, reason) =>
                          controller.setSliderIndex(index),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.sp),
                          child: Row(
                            children: [
                              DotSliderWidget(
                                dotLength:
                                    lotDetailsModel.lotImages?.length ?? 0,
                                activeDot: controller.sliderIndex,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_outlined,
                                  color: AppColors.primaryPurple,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: AppColors.primaryPurple,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(
                          lotDetailsModel.title ?? "",
                          style: TextStyle(fontSize: 28.sp),
                        ),
                        Text(
                          lotDetailsModel.subtitle ?? "",
                          style: TextStyle(fontSize: 17.sp),
                        ),

                        SizedBox(height: 8.h),

                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.timerIcon),
                            Text(
                              "${lotDetailsModel.timeLeft} sec left",
                              style: TextStyle(color: AppColors.primaryDanger),
                            ),
                          ],
                        ),

                        SizedBox(height: 20.h),

                        _buildConditionSection(),

                        SizedBox(height: 16.h),

                        CustomExpantionWidget(
                          title: "Description",
                          description:
                              "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata",
                          index: 0,
                        ),

                        SizedBox(height: 8.h),

                        CustomExpantionWidget(
                          title: "Special Feature",
                          description: "Testing",
                          index: 1,
                        ),

                        SizedBox(height: 8.h),

                        CustomExpantionWidget(
                          title: "Delivery Available In",
                          description: "Testing",
                          index: 2,
                        ),

                        SizedBox(height: 20.h),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST0lk0Ds9xP0Bpozi81cqOhD71vgYGgFie-Q&s",
                                  width: 60.w,
                                  height: 60.h,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pristine Auction",
                                        style: TextStyle(fontSize: 17.sp),
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColors.primaryBlack
                                                    .withAlpha(
                                                      (255 * .1).round(),
                                                    ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(10.sp),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Text("Follow"),
                                              ),
                                            ),
                                          ),

                                          SizedBox(width: 8.w),

                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColors.primaryBlack
                                                    .withAlpha(
                                                      (255 * .1).round(),
                                                    ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                            ),
                                            child: InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                padding: EdgeInsets.all(10.sp),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppAssets.messengerIcon,
                                                    ),
                                                    SizedBox(width: 8.w),
                                                    Text("Message Auctioneer"),
                                                  ],
                                                ),
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
                          ],
                        ),

                        SizedBox(height: 60.h),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBlack.withAlpha(
                                    (255 * .06).round(),
                                  ),
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(14.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Starting",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.primaryBlack
                                              .withAlpha((255 * .6).round()),
                                        ),
                                      ),
                                      Text(
                                        "£75",
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBlack.withAlpha(
                                    (255 * .06).round(),
                                  ),
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(14.sp),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Bids",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.primaryBlack
                                                .withAlpha((255 * .6).round()),
                                          ),
                                        ),
                                        Text(
                                          "23 bidder",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.primaryBlack.withAlpha(
                                    (255 * .06).round(),
                                  ),
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(14.sp),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Highest bid",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.primaryBlack
                                                .withAlpha((255 * .6).round()),
                                          ),
                                        ),
                                        Text(
                                          "£220",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Row _buildConditionSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),

            child: Padding(
              padding: EdgeInsets.all(14.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Condition",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .6).round(),
                      ),
                    ),
                  ),
                  Text("New", style: TextStyle(fontSize: 15.sp)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),

            child: Padding(
              padding: EdgeInsets.all(14.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Color",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .6).round(),
                      ),
                    ),
                  ),
                  Text("BLACK", style: TextStyle(fontSize: 15.sp)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),

            child: Padding(
              padding: EdgeInsets.all(14.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Size",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .6).round(),
                      ),
                    ),
                  ),
                  Text("XXL", style: TextStyle(fontSize: 15.sp)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
