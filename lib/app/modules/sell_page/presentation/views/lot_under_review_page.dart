import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

class LotUnderReviewPage extends StatelessWidget {
  const LotUnderReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 48.h),
                SvgPicture.asset(
                  width: double.infinity,
                  height: 178.h,
                  AppAssets.yourDoneImg,
                ),
                SizedBox(height: 24.h),
                SvgPicture.asset(
                  width: double.infinity,
                  height: 178.h,
                  AppAssets.yourLotUnderReviewImg,
                ),

                SizedBox(height: 300.h),
                TextButton(
                  onPressed: () {
                    Get.offAllNamed(AppRoutes.bottomNavRoute);
                  },
                  child: Text(
                    "Return home",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
