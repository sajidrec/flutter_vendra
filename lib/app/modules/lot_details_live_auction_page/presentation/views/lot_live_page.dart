import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/lot_details_live_auction_page/presentation/controllers/lot_live_page_controller.dart';
import 'package:video_player/video_player.dart';

class LotLivePage extends StatelessWidget {
  LotLivePage({super.key});

  final LotLivePageController controller = Get.put(LotLivePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryWhite,
        actions: [
          Padding(
            padding: EdgeInsets.all(6.sp),
            child: Row(
              children: [
                Text("Paddle No", style: TextStyle(fontSize: 17.sp)),
                SizedBox(width: 6.w),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryPurple,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6.sp),
                    child: Text(
                      "9",
                      style: TextStyle(color: AppColors.primaryWhite),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        title: Text(
          "Live Auction",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<LotLivePageController>(
            builder: (controller) {
              if (!controller.isInitialized) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              return Column(
                children: [
                  Stack(
                    children: [
                      AspectRatio(
                        aspectRatio:
                            controller.videoController.value.aspectRatio,
                        child: VideoPlayer(controller.videoController),
                      ),

                      Positioned(
                        left: 10.w,
                        bottom: 10.w,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryDanger,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.sp),
                            child: Row(
                              children: [
                                Text(
                                  "LIVE",
                                  style: TextStyle(
                                    color: AppColors.primaryWhite,
                                    fontSize: 17.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                SvgPicture.asset(AppAssets.videoIcon),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 14.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Vintage Leader Jacket",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                            Spacer(),
                            Text(
                              "In Progress",
                              style: TextStyle(
                                fontSize: 17.sp,
                                color: AppColors.primarySuccess,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 14.h),

                        Divider(
                          color: AppColors.primaryBlack.withAlpha(
                            (255 * .1).round(),
                          ),
                        ),

                        SizedBox(height: 14.h),

                        Row(
                          children: [
                            Text(
                              "Current Bid",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Spacer(),
                            Text("0 Bids", style: TextStyle(fontSize: 17.sp)),
                          ],
                        ),

                        SizedBox(height: 14.h),

                        Text("N/A", style: TextStyle(fontSize: 28.sp)),

                        SizedBox(height: 28.h),

                        Text(
                          "The bid is not yours",
                          style: TextStyle(fontSize: 13.sp),
                        ),

                        SizedBox(height: 16.h),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              backgroundColor: AppColors.primaryBlack,
                              foregroundColor: AppColors.primaryWhite,
                            ),
                            onPressed: () {},
                            child: Text("Bid £300"),
                          ),
                        ),

                        SizedBox(height: 16.h),

                        Center(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "Switch to next bid",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ),
                        ),

                        SizedBox(height: 16.h),

                        Text(
                          "All bids are binding.",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.primaryBlack.withAlpha(
                              (255 * .6).round(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
