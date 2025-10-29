import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/lot_details_live_auction_page/presentation/controllers/lot_live_page_controller.dart';
import 'package:video_player/video_player.dart';

class LotLivePage extends StatefulWidget {
  const LotLivePage({super.key});

  @override
  State<LotLivePage> createState() => _LotLivePageState();
}

class _LotLivePageState extends State<LotLivePage> {
  final LotLivePageController controller = Get.put(LotLivePageController());

  @override
  void initState() {
    super.initState();
    controller.videoController.play();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        controller.videoController.pause();
      },
      child: Scaffold(
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
                              onPressed: () {
                                Get.bottomSheet(
                                  SafeArea(
                                    child: Container(
                                      width: Get.width - 32.sp,
                                      padding: EdgeInsets.all(16.sp),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                      ),

                                      color: AppColors.primaryBlack,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Are you sure?",
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              color: AppColors.primaryWhite,
                                            ),
                                          ),
                                          Text(
                                            "You about to enter the bidding and submit the bid amount.",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: AppColors.primaryWhite,
                                            ),
                                          ),

                                          SizedBox(height: 8.h),
                                          Text(
                                            "Bid",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              color: AppColors.primaryWhite,
                                            ),
                                          ),
                                          Text(
                                            "£300",
                                            style: TextStyle(
                                              fontSize: 28.sp,
                                              color: AppColors.primaryWhite,
                                            ),
                                          ),
                                          SizedBox(height: 20.h),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4.r,
                                                          ),
                                                    ),
                                                    backgroundColor:
                                                        AppColors.primaryPurple,
                                                    foregroundColor:
                                                        AppColors.primaryWhite,
                                                  ),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Confirm",
                                                    style: TextStyle(
                                                      fontSize: 17.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 12.w),
                                              Expanded(
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4.r,
                                                          ),
                                                      side: BorderSide(
                                                        color: AppColors
                                                            .primaryWhite,
                                                      ),
                                                    ),
                                                    backgroundColor:
                                                        AppColors.primaryBlack,
                                                    foregroundColor:
                                                        AppColors.primaryWhite,
                                                  ),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      fontSize: 17.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          // TODO: fix from here
                                          // SizedBox(height: 12.h),
                                          // Text("All bids are binding."),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
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
      ),
    );
  }
}
