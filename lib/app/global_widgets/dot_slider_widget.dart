import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';

class DotSliderWidget extends StatelessWidget {
  const DotSliderWidget({
    super.key,
    required this.dotLength,
    required this.activeDot,
  });

  final int dotLength;
  final int activeDot;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotLength,
        (index) => Row(
          children: [
            index == activeDot
                ? Container(
                    width: 6.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlack,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  )
                : Container(
                    width: 6.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryBlack),
                      color: AppColors.primaryWhite,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
            if (index != dotLength - 1) SizedBox(width: 6.w),
          ],
        ),
      ),
    );
  }
}
