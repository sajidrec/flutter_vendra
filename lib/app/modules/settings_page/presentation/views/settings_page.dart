import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/settings_page/presentation/controllers/settings_page_controller.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

import '../widgets/choose_currency_bottomsheet_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: AppColors.primaryWhite,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                _buildSwitchToPremiumMsgButton(),
                SizedBox(height: 16.h),
                _buildOptions(
                  iconPath: AppAssets.generalPeopleIcon,
                  optionName: "General",
                  optionDescription: "Change display name & other information",
                  onTap: () {
                    Get.toNamed(AppRoutes.generalSettingRoute);
                  },
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                _buildOptions(
                  iconPath: AppAssets.lockIcon,
                  optionName: "Security",
                  optionDescription: "Change your account password",
                  onTap: () {
                    Get.toNamed(AppRoutes.securitySettingsRoute);
                  },
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                _buildOptions(
                  iconPath: AppAssets.bankIcon,
                  optionName: "Payment Method",
                  optionDescription: "Update or add your payment method",
                  onTap: () {
                    Get.toNamed(AppRoutes.paymentMethodRoute);
                  },
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                _buildOptions(
                  iconPath: AppAssets.moneyIcon,
                  optionName: "Currency",
                  optionDescription: "Choose your currency",
                  onTap: () async {
                    final selected = await Get.bottomSheet(
                      const ChooseCurrencyBottomSheet(),
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                    );

                    if (selected != null) {
                      log("Selected currency: $selected");
                    }
                  },
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                _buildOptions(
                  iconPath: AppAssets.notificationBellRingIcon,
                  optionName: "Notifications Preferences",
                  optionDescription: "Customize your notification settings",
                  onTap: () {
                    Get.bottomSheet(
                      isScrollControlled: true,
                      _buildNotificationPreferencePopup(),
                    );
                  },
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                _buildOptions(
                  iconPath: AppAssets.sheildWithRightTickIcon,
                  optionName: "Privacy Policy",
                  optionDescription: "Learn about Privacy policy",
                  onTap: () {
                    Get.bottomSheet(
                      isScrollControlled: true,
                      _buildPrivacyPolicy(),
                    );
                  },
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                _buildOptions(
                  iconPath: AppAssets.infoIcon,
                  optionName: "About",
                  optionDescription: "Version 2.0",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GetBuilder<SettingsPageController> _buildNotificationPreferencePopup() {
    return GetBuilder<SettingsPageController>(
      builder: (controller) {
        return Container(
          width: double.infinity,
          height: Get.height * .9,
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(6.r),
          ),

          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),

                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Notifications and preferences",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.close),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),
                Text(
                  "Updates and promotions",
                  style: TextStyle(fontSize: 28.sp),
                ),
                Text(
                  "Be the first to know about new features, promo codes and deals",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * .80).round(),
                    ),
                  ),
                ),

                SizedBox(height: 24.h),
                Row(
                  children: [
                    Text("Email", style: TextStyle(fontSize: 17.sp)),
                    Spacer(),
                    Switch(
                      inactiveThumbColor: AppColors.primaryWhite,
                      inactiveTrackColor: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                      value: controller.emailUpdate,
                      onChanged: (value) {
                        controller.toggleEmailUpdate();
                      },
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                Row(
                  children: [
                    Text("SMS", style: TextStyle(fontSize: 17.sp)),
                    Spacer(),
                    Switch(
                      inactiveThumbColor: AppColors.primaryWhite,
                      inactiveTrackColor: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                      value: controller.smsUpdate,
                      onChanged: (value) {
                        controller.toggleSmsUpdate();
                      },
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                Row(
                  children: [
                    Text(
                      "Push notifications",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    Spacer(),
                    Switch(
                      inactiveThumbColor: AppColors.primaryWhite,
                      inactiveTrackColor: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                      value: controller.pushNotification,
                      onChanged: (value) {
                        controller.togglePushNotification();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  GetBuilder<SettingsPageController> _buildPrivacyPolicy() {
    return GetBuilder<SettingsPageController>(
      init: SettingsPageController(),
      builder: (controller) {
        return Container(
          width: double.infinity,
          height: Get.height * .9,
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.circular(6.r),
          ),

          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "Privacy policy",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  SvgPicture.asset(AppAssets.privacyPolicyImg),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector _buildOptions({
    required String iconPath,
    required String optionName,
    required String optionDescription,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(iconPath, width: 24.w, height: 24.h),
          SizedBox(width: 28.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(optionName, style: TextStyle(fontSize: 17.sp)),
              Text(optionDescription, style: TextStyle(fontSize: 13.sp)),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios_rounded),
        ],
      ),
    );
  }

  Container _buildSwitchToPremiumMsgButton() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryPurple.withAlpha((255 * .07).round()),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 24.w, left: 10.w),
              child: SvgPicture.asset(
                AppAssets.switchPeopleVersionIcon,
                width: 24.w,
                height: 24.h,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Switch to Pro. Buyer",
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  Text(
                    "Switch your account to pro. buyer account safely",
                    style: TextStyle(fontSize: 13.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
