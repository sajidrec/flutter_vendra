import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/become_professional_buyer/presentation/views/business_info_page.dart';

import '../../../../core/constants/app_colors.dart';
import '../controllers/become_pro_buyer_page_controller.dart';

import '../widgets/progress_bar_widget.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<BecomeProBuyerPageController>(
          init: BecomeProBuyerPageController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProgressBarWidget(
                    progressedIndex: controller.progressedIndex,
                    progressLength: 4,
                    controller: controller,
                  ),

                  Text(
                    "Personal information",
                    style: TextStyle(fontSize: 28.sp),
                  ),

                  SizedBox(height: 20.h),

                  Text(
                    "First Name",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                  TextFormField(
                    controller: controller.firstNameTEC,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        controller.setFirstNameFilled(false);
                      } else {
                        controller.setFirstNameFilled(true);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "e.g. Steve",
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
                  SizedBox(height: 20.h),
                  Text(
                    "Last Name",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.primaryBlack,
                    ),
                  ),
                  TextFormField(
                    controller: controller.lastNameTEC,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        controller.setLastNameFilled(false);
                      } else {
                        controller.setLastNameFilled(true);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "e.g. Moss",
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
                  Spacer(),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: AppColors.primaryBlack),
                      children: [
                        TextSpan(
                          text: "By continue, you agree to the Gavellia ",
                        ),
                        TextSpan(
                          text: "Terms of Service and ",
                          style: TextStyle(
                            color: AppColors.primaryPeriwinkle,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text:
                              "to occasionally receive emails from us. Please read our ",
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            color: AppColors.primaryPeriwinkle,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(text: " to learn how use your personal data."),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          (controller.firstNameFilled &&
                              controller.lastNameFilled)
                          ? () {
                              Get.to(BusinessInfoPage());
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlack,
                        foregroundColor: AppColors.primaryWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      child: Text(
                        "Continue",
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
    );
  }
}
