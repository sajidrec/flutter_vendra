import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../controller/become_seller_step_page_controller.dart';

class BecomeSellerStepPage extends StatelessWidget {
  BecomeSellerStepPage({super.key});

  late final List _pages = [
    _buildPersonalInformationPage(),
    _buildBusinessInformationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<BecomeSellerStepPageController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressBar(
                    progressedIndex: controller.progressedIndex,
                    progressLength: _pages.length,
                    controller: controller,
                  ),
                  _pages[controller.progressedIndex - 1],
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Padding _buildPersonalInformationPage() {
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

  Padding _buildBusinessInformationPage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<BecomeSellerStepPageController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Business information", style: TextStyle(fontSize: 28.sp)),

              SizedBox(height: 20.h),

              Text(
                "Business Name",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextFormField(
                controller: controller.businessNameTec,
                decoration: InputDecoration(
                  hintText: "Enter your business name",
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
                "Business Type",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextFormField(
                controller: controller.businessTypeTec,
                decoration: InputDecoration(
                  hintText: "e.g. LLC, Inc",
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

              SizedBox(height: 24.h),
              Text("Business Address", style: TextStyle(fontSize: 17.sp)),
              SizedBox(height: 8.h),
              Text(
                "Street",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextFormField(
                controller: controller.streetTec,
                decoration: InputDecoration(
                  hintText: "e.g. 123 Main Street, Suite 400",
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
                "City",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextFormField(
                controller: controller.cityTec,
                decoration: InputDecoration(
                  hintText: "e.g. New York",
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

              SizedBox(height: 24.h),

              Text(
                "State (Optional)",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),

              _buildSelectState(controller),

              SizedBox(height: 36.h),

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

  Padding _buildProgressBar({
    required int progressedIndex,
    required int progressLength,
    required BecomeSellerStepPageController controller,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              controller.decreaseProgressIndex();
              if (controller.progressedIndex == 0) {
                Get.back();
              }
            },
            child: SvgPicture.asset(
              AppAssets.backArrowIcon,
              width: 32.w,
              height: 32.h,
              colorFilter: ColorFilter.mode(
                AppColors.primaryBlack,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 25.w),
          Expanded(
            child: LinearProgressIndicator(
              value: progressedIndex / progressLength,
              color: AppColors.primaryBlack,
              backgroundColor: AppColors.nural6,
              minHeight: 2.h,
            ),
          ),
          SizedBox(width: 25.w),
          Text(
            "$progressedIndex/$progressLength",
            style: TextStyle(fontSize: 15.sp),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildSelectState(BecomeSellerStepPageController controller) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: GetBuilder<BecomeSellerStepPageController>(
              builder: (controller) {
                return SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.close),
                            ),
                            Spacer(),
                            Text(
                              "State",
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        TextField(
                          onChanged: (query) {
                            if (controller.stateList.isNotEmpty) {
                              controller.searchStates(query);
                            }
                          },
                          controller: controller.searchStateTec,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 13.5.h,
                              horizontal: 12.5.w,
                            ),
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search...",
                            filled: true,
                            fillColor: AppColors.primaryBlack.withAlpha(
                              (255 * .06).round(),
                            ),
                            border: InputBorder.none,
                          ),
                        ),

                        Flexible(
                          // height: 250.h,
                          // width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.filteredStateList.length,
                            itemBuilder: (context, index) {
                              final state = controller.filteredStateList[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.selectState(state);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(14.sp),
                                  child: Row(
                                    children: [
                                      Text(
                                        state,
                                        style: TextStyle(fontSize: 17.sp),
                                      ),
                                      Spacer(),
                                      controller.isSelected(state)
                                          ? Icon(Icons.check)
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        // SizedBox(height: 8.h),
                        Divider(
                          color: AppColors.primaryBlack.withAlpha(
                            (255 * .1).round(),
                          ),
                        ),
                        // SizedBox(height: 8.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlack,
                              foregroundColor: AppColors.primaryWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Expanded(
                              child: Text(
                                "Done",
                                style: TextStyle(fontSize: 17.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,

          border: Border.all(
            color: AppColors.primaryBlack.withAlpha((255 * .10).round()),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 17.h),
              child: Text(
                controller.selectedState == null
                    ? "Select"
                    : controller.selectedState ?? "",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: controller.selectedState == null
                      ? AppColors.primaryBlack.withAlpha((255 * .35).round())
                      : AppColors.primaryBlack,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 14.w),
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: SvgPicture.asset(
                  AppAssets.forwardArrowIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
