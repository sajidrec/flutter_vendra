import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/auth/register_page/presentation/controllers/verify_otp_page_controller.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify OTP"),
        centerTitle: true,
        backgroundColor: AppColors.primaryWhite,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<VerifyOtpPageController>(
            init: VerifyOtpPageController(),
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Center(
                      child: Pinput(
                        length: 6,
                        onChanged: (value) {
                          if (value.length < 6) {
                            controller.setPinFilledStatus(false);
                          } else {
                            controller.setPinFilledStatus(true);
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.pinFilled
                            ? () {
                                if (context.mounted) {
                                  Get.offAllNamed(AppRoutes.bottomNavRoute);
                                } else {
                                  log("not mounted");
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlack,
                          foregroundColor: AppColors.primaryWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                        child: Text(
                          "Verify",
                          style: TextStyle(fontSize: 17.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
