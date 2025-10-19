import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../controllers/sell_page_controller.dart';

class LotDetailsPage extends StatelessWidget {
  const LotDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return (Get.arguments == null)
        ? _buildThePage()
        : (Get.arguments["shouldWrapWithScaffold"] ?? false)
        ? Scaffold(body: SafeArea(child: _buildThePage()))
        : _buildThePage();
  }

  GetBuilder<SellPageController> _buildThePage() {
    return GetBuilder<SellPageController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Lot details", style: TextStyle(fontSize: 28.sp)),
              SizedBox(height: 8.h),
              Text(
                "Enter your lot’s title, core features  and essential description.",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColors.primaryBlack.withAlpha((255 * .8).round()),
                ),
              ),
              SizedBox(height: 20.h),
              Text("Lot Title*", style: TextStyle(fontSize: 13.sp)),
              TextField(
                controller: controller.lotTitleTec,
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.setLotTitleFilled(false);
                  } else {
                    controller.setLotTitleFilled(true);
                  }
                },
                maxLength: 80,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "Enter lot tile",
                  hintStyle: TextStyle(
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * 0.35).round(),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "Max 80 letters",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack.withAlpha((255 * .60).round()),
                ),
              ),
              SizedBox(height: 16.h),
              Text("Category*", style: TextStyle(fontSize: 13.sp)),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primaryWhite,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6.r),
                          topLeft: Radius.circular(6.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.sp),
                        child: Column(
                          children: [
                            Text("Category", style: TextStyle(fontSize: 16.sp)),
                            SizedBox(height: 8.h),
                            Expanded(
                              child: GetBuilder<SellPageController>(
                                builder: (controller) {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        if (controller.selectedCategoryIndex ==
                                            index) {
                                          controller.setSelectedCategoryIndex(
                                            -1,
                                          );
                                        } else {
                                          controller.setSelectedCategoryIndex(
                                            index,
                                          );
                                        }
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(12.sp),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Optimal Media",
                                              style: TextStyle(fontSize: 16.sp),
                                            ),
                                            Spacer(),
                                            index ==
                                                    controller
                                                        .selectedCategoryIndex
                                                ? Icon(Icons.check)
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                      ),
                                    ),
                                    itemCount: 50,
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 16.h),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                  backgroundColor: AppColors.primaryBlack,
                                  foregroundColor: AppColors.primaryWhite,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("Done"),
                              ),
                            ),
                            SizedBox(height: 16.h),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .35).round(),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 17.h,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Select",
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: AppColors.primaryBlack.withAlpha(
                              (255 * .35).round(),
                            ),
                          ),
                        ),
                        Spacer(),
                        SvgPicture.asset(AppAssets.forwardArrowIcon),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text("Subcategory*", style: TextStyle(fontSize: 13.sp)),
              TextField(
                controller: controller.subCategoryTec,
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.setSubCategoryFilled(false);
                  } else {
                    controller.setSubCategoryFilled(true);
                  }
                },
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "Subcategory",
                  hintStyle: TextStyle(
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * 0.35).round(),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Special Feature (Optional)",
                style: TextStyle(fontSize: 13.sp),
              ),
              TextField(
                controller: controller.specialCategoryTec,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "Enter special feature",
                  hintStyle: TextStyle(
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * 0.35).round(),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text("Description*", style: TextStyle(fontSize: 13.sp)),
              TextField(
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.setDescriptionFilled(false);
                  } else {
                    controller.setDescriptionFilled(true);
                  }
                },
                maxLines: 4,
                maxLength: 800,
                controller: controller.descriptionTec,
                decoration: InputDecoration(
                  hintText: "Write your lot description...",
                  hintStyle: TextStyle(
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * 0.35).round(),
                    ),
                  ),

                  border: OutlineInputBorder(
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
              SizedBox(height: 8.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      (controller.lotTitleFilled &&
                          controller.subCategoryFilled &&
                          controller.descriptionFilled &&
                          controller.selectedCategoryIndex >= 0)
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

                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }
}
