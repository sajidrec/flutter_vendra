import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/auth/forget_pass_page/controllers/otp_verify_page_controller.dart';
import 'package:vendra_app/app/modules/auth/forget_pass_page/views/new_password_page.dart';

class OtpVerifyPage extends StatelessWidget {
  const OtpVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Verify OTP"),
          centerTitle: true,
          backgroundColor: AppColors.primaryWhite,
        ),
        body: SingleChildScrollView(
          child: GetBuilder<OtpVerifyPageController>(
            init: OtpVerifyPageController(),
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
                                Get.to(NewPasswordPage());
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
                          "Submit",
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
