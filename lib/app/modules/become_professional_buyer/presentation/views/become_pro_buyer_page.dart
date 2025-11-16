import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/become_professional_buyer/presentation/views/personal_info.dart';

class BecomeProBuyerPage extends StatelessWidget {
  const BecomeProBuyerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Spacer(),
              Image.asset(AppAssets.becomeProBuyerImg, width: double.infinity),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlack,
                    foregroundColor: AppColors.primaryWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                  ),
                  onPressed: () {
                    Get.to(PersonalInfo());
                  },
                  child: Text("Get started", style: TextStyle(fontSize: 17.sp)),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
