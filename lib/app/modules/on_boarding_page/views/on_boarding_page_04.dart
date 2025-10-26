import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/on_boarding_page/controller/on_boarding_page_controller.dart';

class OnBoardingPage04 extends StatelessWidget {
  const OnBoardingPage04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SizedBox(
            width: double.infinity,
            child: GetBuilder<OnBoardingPageController>(
              builder: (controller) {
                return OutlinedButton(
                  onPressed: () async {
                    await controller.requestNotificationPermission();
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryBlack),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  child: Text(
                    "Keep me updated",
                    style: TextStyle(
                      color: AppColors.primaryBlack,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        AppAssets.backArrowIcon,
                        width: 32.w,
                        height: 32.h,
                        colorFilter: ColorFilter.mode(
                          AppColors.primaryBlack,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(width: 25.w),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 1,
                        color: AppColors.primaryBlack,
                        backgroundColor: AppColors.nural6,
                        minHeight: 2.h,
                      ),
                    ),
                    SizedBox(width: 25.w),
                    Text("4/4", style: TextStyle(fontSize: 15.sp)),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get updates on  lots you buy & sale",
                      // textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Get notifications about activity on your listings and price drops on lots you love. Allow tracking so we can show you lot that match your interest.",

                      style: TextStyle(fontSize: 17, color: AppColors.nutral80),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
