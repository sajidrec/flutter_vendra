import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

class OnBoardingPage03 extends StatelessWidget {
  const OnBoardingPage03({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                        value: 0.75,
                        color: AppColors.primaryBlack,
                        backgroundColor: AppColors.nural6,
                        minHeight: 2.h,
                      ),
                    ),
                    SizedBox(width: 25.w),
                    Text("3/4", style: TextStyle(fontSize: 15.sp)),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 235.h),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.giftIcon,
                    width: 236.w,
                    height: 148.h,
                  ),
                ),
              ),

              SizedBox(height: 115.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Win & celebrate",
                      // textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Join live auctions from anywhere, set automatic bids, and celebrate your wins. The thrill of the win, delivered to your door.",
                      style: TextStyle(fontSize: 17, color: AppColors.nutral80),
                    ),
                    SizedBox(height: 22.h),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.onBoardingRoute4);
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.primaryBlack),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: AppColors.primaryBlack,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
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
