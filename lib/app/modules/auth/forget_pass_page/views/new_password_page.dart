import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/auth/forget_pass_page/controllers/new_password_page_controller.dart';
import 'package:vendra_app/app/modules/auth/forget_pass_page/utils/helper/password_helper.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Change Password"),
          centerTitle: true,
          backgroundColor: AppColors.primaryWhite,
        ),

        body: SingleChildScrollView(
          child: GetBuilder<NewPasswordPageController>(
            init: NewPasswordPageController(),
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("New password"),
                    TextField(
                      onChanged: (value) {
                        PasswordHelper.checkPasswordValidity(
                          value: value,
                          controller: controller,
                        );

                        if (value.isNotEmpty) {
                          if (value == controller.confirmPassTEC.text) {
                            controller.setBothPassMatchedStatus(true);
                          } else {
                            controller.setBothPassMatchedStatus(false);
                          }
                        }
                      },
                      controller: controller.passTEC,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide(
                            color: AppColors.primaryBlack.withAlpha(
                              (255 * .1).round(),
                            ),
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
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Text("Confirm password"),
                    TextField(
                      controller: controller.confirmPassTEC,
                      onChanged: (value) {
                        PasswordHelper.checkPasswordValidity(
                          value: value,
                          controller: controller,
                        );

                        if (value.isNotEmpty) {
                          if (value == controller.confirmPassTEC.text) {
                            controller.setBothPassMatchedStatus(true);
                          } else {
                            controller.setBothPassMatchedStatus(false);
                          }
                        }
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.r),
                          borderSide: BorderSide(
                            color: AppColors.primaryBlack.withAlpha(
                              (255 * .1).round(),
                            ),
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
                      ),
                    ),
                    SizedBox(height: 12.h),

                    (controller.atLeast1Number &&
                            controller.atLeast8Char &&
                            controller.bothUpperAndLowerCase &&
                            controller.bothPassMatched)
                        ? SizedBox.shrink()
                        : Text(
                            "Make sure password has at least 1 number, 1 lowercase caharcter, 1 uppercase character, at least 8 characters long and both password matches",
                            style: TextStyle(
                              color: AppColors.primaryDanger,
                              fontSize: 13.sp,
                            ),
                          ),

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
                        onPressed:
                            (controller.atLeast1Number &&
                                controller.atLeast8Char &&
                                controller.bothUpperAndLowerCase &&
                                controller.bothPassMatched)
                            ? () {
                                Get.offAllNamed(AppRoutes.bottomNavRoute);
                              }
                            : null,
                        child: Text("Save", style: TextStyle(fontSize: 17.sp)),
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
