import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/auth/register_page/presentation/controllers/registration_page_controller.dart';
import 'package:vendra_app/app/modules/auth/register_page/presentation/utils/helper/email_helper.dart';
import 'package:vendra_app/app/modules/auth/register_page/presentation/utils/helper/password_helper.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<RegistrationPageController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildCustomAppBar(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Full Name",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.primaryBlack,
                                ),
                              ),
                              TextFormField(
                                controller: controller.fullNameTEC,
                                onChanged: (value) {
                                  if (value.length >= 2) {
                                    controller.setValidName(true);
                                  } else {
                                    controller.setValidName(false);
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "E.g. John Smith",
                                  hintStyle: TextStyle(
                                    color: AppColors.primaryBlack.withAlpha(
                                      (255 * .35).round(),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 17.h,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    borderSide: BorderSide(
                                      color: AppColors.primaryBlack.withAlpha(
                                        (255 * .01).round(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.h),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.primaryBlack,
                                ),
                              ),
                              TextFormField(
                                controller: controller.emailTEC,
                                onChanged: (value) {
                                  EmailHelper.checkEmailValidity(
                                    value: value,
                                    controller: controller,
                                  );
                                },
                                decoration: InputDecoration(
                                  hintText: "example@email.com",
                                  hintStyle: TextStyle(
                                    color: AppColors.primaryBlack.withAlpha(
                                      (255 * .35).round(),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 17.h,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    borderSide: BorderSide(
                                      color: AppColors.primaryBlack.withAlpha(
                                        (255 * .01).round(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.h),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Password",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.primaryBlack,
                                ),
                              ),
                              TextFormField(
                                controller: controller.passTEC,
                                obscureText: controller.obscurePass,
                                onChanged: (value) {
                                  PasswordHelper.checkPasswordValidity(
                                    value: value,
                                    controller: controller,
                                  );
                                },

                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.toggleObscurePass();
                                    },
                                    icon: Icon(
                                      controller.obscurePass
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                    ),
                                  ),
                                  hintText: "Create a password",
                                  hintStyle: TextStyle(
                                    color: AppColors.primaryBlack.withAlpha(
                                      (255 * .35).round(),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 14.w,
                                    vertical: 17.h,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                    borderSide: BorderSide(
                                      color: AppColors.primaryBlack.withAlpha(
                                        (255 * .01).round(),
                                      ),
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
                                          : AppColors.primaryBlack.withAlpha(
                                              (255 * .40).round(),
                                            ),
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
                                          : AppColors.primaryBlack.withAlpha(
                                              (255 * .40).round(),
                                            ),
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
                                          : AppColors.primaryBlack.withAlpha(
                                              (255 * .40).round(),
                                            ),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 24.h),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "I accept the terms and I have read the Privacy Policy & Cookies.",
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: AppColors.primaryBlack,
                                      ),
                                    ),
                                  ),
                                  Switch(
                                    value: controller.acceptTermsAndCondition,
                                    onChanged: (value) => controller
                                        .toggleAcceptTermsAndCondition(),
                                    inactiveThumbColor: AppColors.primaryWhite,
                                    inactiveTrackColor: AppColors.primaryBlack
                                        .withAlpha((255 * .06).round()),
                                    trackOutlineColor: WidgetStatePropertyAll(
                                      Colors.transparent,
                                    ),
                                    activeThumbColor: AppColors.primaryWhite,
                                    activeTrackColor: AppColors.primarySuccess,
                                  ),
                                ],
                              ),
                              SizedBox(height: 24.h),
                              _buildRegisterButton(controller),
                              SizedBox(height: 24.h),
                              _buildOrDivider(),
                              SizedBox(height: 24.h),
                              SizedBox(
                                width: double.infinity,
                                child: InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    AppAssets.continueWithGoogleOutlineButton,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Row _buildOrDivider() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            height: 1,
            color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Text("Or", style: TextStyle(fontSize: 13.sp)),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            height: 1,
            color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
          ),
        ),
      ],
    );
  }

  SizedBox _buildRegisterButton(RegistrationPageController controller) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed:
            (controller.validName &&
                controller.validEmail &&
                controller.atLeast8Char &&
                controller.atLeast1Number &&
                controller.bothUpperAndLowerCase &&
                controller.acceptTermsAndCondition)
            ? () {}
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        child: Text(
          "Register",
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryWhite,
          ),
        ),
      ),
    );
  }

  Padding _buildCustomAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 9.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(alignment: Alignment.centerLeft, child: _buildBackButton()),
          Center(
            child: Text(
              "Register to Gavellia",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }

  InkWell _buildBackButton() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Row(
        children: [
          SvgPicture.asset(AppAssets.backArrowIcon2, width: 20.w, height: 20.h),
          SizedBox(width: 5.w),
          Text(
            "Back",
            style: TextStyle(fontSize: 17.sp, color: AppColors.primaryBlack),
          ),
        ],
      ),
    );
  }
}
