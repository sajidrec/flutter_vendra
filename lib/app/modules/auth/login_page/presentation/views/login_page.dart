import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/auth/login_page/presentation/controller/login_page_controller.dart';
import 'package:vendra_app/app/modules/auth/login_page/presentation/utils/email_helper.dart';
import 'package:vendra_app/app/modules/auth/login_page/presentation/utils/password_helper.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<LoginPageController>(
            builder: (controller) {
              return Column(
                children: [
                  _buildCustomAppBar(),
                  Form(
                    key: controller.formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 20.h,
                        left: 24.w,
                        right: 24.w,
                      ),
                      child: Column(
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

                          SizedBox(height: 16.h),

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
                            onChanged: (value) =>
                                PasswordHelper.checkPasswordValidity(
                                  value: value,
                                  controller: controller,
                                ),
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
                              hintText: "Password",
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

                          SizedBox(height: 16.h),

                          _buildLoginButton(controller),
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

  Padding _buildCustomAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 9.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(alignment: Alignment.centerLeft, child: _buildBackButton()),
          Center(
            child: Text(
              "Login To Gavellia",
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

  SizedBox _buildLoginButton(LoginPageController controller) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed:
            (controller.validEmail &&
                controller.atLeast8Char &&
                controller.atLeast1Number &&
                controller.bothUpperAndLowerCase)
            ? () {}
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryWhite,
          ),
        ),
      ),
    );
  }
}
