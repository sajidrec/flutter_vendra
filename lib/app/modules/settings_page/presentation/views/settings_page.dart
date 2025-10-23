import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';

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
                  onTap: () {},
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                _buildOptions(
                  iconPath: AppAssets.lockIcon,
                  optionName: "Security",
                  optionDescription: "Change your account password",
                  onTap: () {},
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                _buildOptions(
                  iconPath: AppAssets.bankIcon,
                  optionName: "Payment Method",
                  optionDescription: "Update or add your payment method",
                  onTap: () {},
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                _buildOptions(
                  iconPath: AppAssets.moneyIcon,
                  optionName: "Currency",
                  optionDescription: "Choose your currency",
                  onTap: () {},
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                _buildOptions(
                  iconPath: AppAssets.notificationBellRingIcon,
                  optionName: "Notifications Preferences",
                  optionDescription: "Customize your notification settings",
                  onTap: () {},
                ),
                Divider(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                _buildOptions(
                  iconPath: AppAssets.sheildWithRightTickIcon,
                  optionName: "Privacy Policy",
                  optionDescription: "Learn about Privacy policy",
                  onTap: () {},
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
