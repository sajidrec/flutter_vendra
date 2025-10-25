import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/helpers/password_helper.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../controllers/security_settings_page_controller.dart';

class SecuritySettingsPage extends StatelessWidget {
  const SecuritySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Security"),
          backgroundColor: AppColors.primaryWhite,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: GetBuilder<SecuritySettingsPageController>(
              builder: (controller) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                          color: AppColors.primaryBlack.withAlpha(
                            (255 * .1).round(),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: SizedBox(
                          width: double.infinity,
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Update password",
                                  style: GoogleFonts.ptSerif(fontSize: 28.sp),
                                ),
                                Text(
                                  "Keep your account safe use a strong password and update it regularly.",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.primaryBlack.withAlpha(
                                      (255 * .8).round(),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 24.h),
                                _buildPasswordInputFiled(
                                  controller: controller,
                                  inputText: "Password",
                                  hintText: "Enter current password",
                                ),

                                SizedBox(height: 16.h),

                                _buildNewPasswordField(controller),

                                SizedBox(height: 16.h),

                                Text(
                                  "Confirm Password",
                                  style: TextStyle(fontSize: 13.sp),
                                ),
                                TextFormField(
                                  controller: controller.confirmPasswordTEC,
                                  obscureText: controller.obscureConfirmPass,
                                  onChanged: (value) {
                                    if (controller
                                            .newPasswordTEC
                                            .text
                                            .isNotEmpty &&
                                        controller.newPasswordTEC.text ==
                                            controller
                                                .confirmPasswordTEC
                                                .text) {
                                      controller.setBothPasswordMatch(true);
                                    } else {
                                      controller.setBothPasswordMatch(false);
                                    }

                                    if (controller
                                            .newPasswordTEC
                                            .text
                                            .isNotEmpty &&
                                        controller.newPasswordTEC.text ==
                                            controller
                                                .confirmPasswordTEC
                                                .text) {
                                      controller.setBothPasswordMatch(true);
                                    } else {
                                      controller.setBothPasswordMatch(false);
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter new password",
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.toggleConfirmPass();
                                      },
                                      icon: Icon(
                                        controller.obscureConfirmPass
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined,
                                      ),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 17.sp,
                                      color: AppColors.primaryBlack.withAlpha(
                                        (255 * .35).round(),
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
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.r),
                                      borderSide: BorderSide(
                                        color: AppColors.primaryBlack.withAlpha(
                                          (255 * .1).round(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 24.h),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryBlack,
                                      foregroundColor: AppColors.primaryWhite,
                                    ),
                                    onPressed: (controller.bothPasswordMatch)
                                        ? () {}
                                        : null,
                                    child: Text(
                                      "Save changes",
                                      style: TextStyle(fontSize: 17.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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

  Column _buildNewPasswordField(SecuritySettingsPageController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("New Password", style: TextStyle(fontSize: 13.sp)),
        TextFormField(
          onChanged: (value) {
            PasswordHelper.checkPasswordValidity(
              value: value,
              controller: controller,
            );

            if (controller.newPasswordTEC.text.isNotEmpty &&
                controller.newPasswordTEC.text ==
                    controller.confirmPasswordTEC.text) {
              controller.setBothPasswordMatch(true);
            } else {
              controller.setBothPasswordMatch(false);
            }
          },
          controller: controller.newPasswordTEC,
          obscureText: controller.obscureNewPass,
          decoration: InputDecoration(
            hintText: "Create a password",
            suffixIcon: IconButton(
              onPressed: () {
                controller.toggleObscureNewPass();
              },
              icon: Icon(
                controller.obscureNewPass
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            hintStyle: TextStyle(
              fontSize: 17.sp,
              color: AppColors.primaryBlack.withAlpha((255 * .35).round()),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            SvgPicture.asset(
              controller.atLeast8Char
                  ? AppAssets.circularGreenTickIcon
                  : AppAssets.circularGrayTickIcon,
              width: 16.w,
              height: 16.h,
            ),
            SizedBox(width: 8.w),
            Text(
              "At least 8 characters ",
              style: TextStyle(
                fontSize: 13.sp,
                color: controller.atLeast8Char
                    ? AppColors.primarySuccess
                    : AppColors.primaryBlack.withAlpha((255 * .40).round()),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            SvgPicture.asset(
              controller.atLeast1Number
                  ? AppAssets.circularGreenTickIcon
                  : AppAssets.circularGrayTickIcon,
              width: 16.w,
              height: 16.h,
            ),
            SizedBox(width: 8.w),
            Text(
              "At least 1 number",
              style: TextStyle(
                fontSize: 13.sp,
                color: controller.atLeast1Number
                    ? AppColors.primarySuccess
                    : AppColors.primaryBlack.withAlpha((255 * .40).round()),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            SvgPicture.asset(
              controller.bothUpperAndLowerCase
                  ? AppAssets.circularGreenTickIcon
                  : AppAssets.circularGrayTickIcon,
              width: 16.w,
              height: 16.h,
            ),
            SizedBox(width: 8.w),
            Text(
              "Both upper case and lower case letters",
              style: TextStyle(
                fontSize: 13.sp,
                color: controller.bothUpperAndLowerCase
                    ? AppColors.primarySuccess
                    : AppColors.primaryBlack.withAlpha((255 * .40).round()),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _buildPasswordInputFiled({
    required SecuritySettingsPageController controller,
    required String inputText,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(inputText, style: TextStyle(fontSize: 13.sp)),
        TextFormField(
          controller: controller.passwordTEC,
          obscureText: controller.obscurePass,

          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: IconButton(
              onPressed: () {
                controller.toggleObscurePass();
              },
              icon: Icon(
                controller.obscureNewPass
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            hintStyle: TextStyle(
              fontSize: 17.sp,
              color: AppColors.primaryBlack.withAlpha((255 * .35).round()),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
