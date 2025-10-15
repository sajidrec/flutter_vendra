import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../controller/become_seller_step_page_controller.dart';

class ProgressBarWidget extends StatelessWidget {
  const ProgressBarWidget({
    super.key,
    required this.progressedIndex,
    required this.progressLength,
    required this.controller,
  });

  final int progressedIndex;
  final int progressLength;
  final BecomeSellerStepPageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              controller.decreaseProgressIndex();
              if (controller.progressedIndex == 0) {
                Get.back();
              }
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
              value: progressedIndex / progressLength,
              color: AppColors.primaryBlack,
              backgroundColor: AppColors.nural6,
              minHeight: 2.h,
            ),
          ),
          SizedBox(width: 25.w),
          Text(
            "$progressedIndex/$progressLength",
            style: TextStyle(fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}
