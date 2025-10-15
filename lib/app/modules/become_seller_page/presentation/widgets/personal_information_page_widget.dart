import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../controller/become_seller_step_page_controller.dart';

class PersonalInformationPageWidget extends StatelessWidget {
  const PersonalInformationPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<BecomeSellerStepPageController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Personal information", style: TextStyle(fontSize: 28.sp)),
              SizedBox(height: 20.h),
              Text(
                "First Name",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextFormField(
                controller: controller.firstNameTec,
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
                controller: controller.lastNameTec,
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
              SizedBox(height: 330.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(color: AppColors.primaryBlack),
                  children: [
                    TextSpan(text: "By continue, you agree to the Gavellia "),
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
                      (controller.firstNameFilled && controller.lastNameFilled)
                      ? () {
                          controller.increaseProgressIndex();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlack,
                    foregroundColor: AppColors.primaryWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  child: Text("Continue", style: TextStyle(fontSize: 17.sp)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
