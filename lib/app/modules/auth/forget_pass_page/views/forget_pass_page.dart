import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/core/constants/regex_constants.dart';
import 'package:vendra_app/app/modules/auth/forget_pass_page/controllers/forget_pass_page_controller.dart';

import 'otp_verify_page.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text(
          "Forget password",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
    
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<ForgetPassPageController>(
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  children: [
                    TextField(
                      controller: controller.emailTEC,
                      onChanged: (value) {
                        if (RegExp(RegexConstants.email).hasMatch(value)) {
                          controller.setValidEmail(true);
                        } else {
                          controller.setValidEmail(false);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "email",
                        hintStyle: TextStyle(
                          color: AppColors.primaryBlack.withAlpha(
                            (255 * .80).round(),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide(
                            color: AppColors.primaryBlack.withAlpha(
                              (255 * .1).round(),
                            ),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlack,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          foregroundColor: AppColors.primaryWhite,
                        ),
                        onPressed: controller.validEmail
                            ? () {
                                Get.to(OtpVerifyPage());
                              }
                            : null,
                        child: Text("Send OTP"),
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
