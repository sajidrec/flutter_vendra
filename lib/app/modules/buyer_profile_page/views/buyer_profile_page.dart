import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/buyer_profile_page/controllers/buyer_profile_page_controller.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../routes/app_routes.dart';
import '../../seller_profile_page/presentation/views/support_page.dart';

class BuyerProfilePage extends StatelessWidget {
  const BuyerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,

        actions: [_buildMoreOptions()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                _buildHeaderSection(),
                SizedBox(height: 20.h),
                _buildProfileShortStatistics(),
                SizedBox(height: 20.h),

                _buildNavMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GetBuilder<BuyerProfilePageController> _buildNavMenu() {
    return GetBuilder<BuyerProfilePageController>(
      builder: (controller) {
        return Container(
          width: double.infinity,
          height: Get.height / 2.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              color: AppColors.primaryBlack.withAlpha((255 * 0.1).round()),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryGray.withAlpha((255 * .12).round()),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: controller.navList
                        .asMap()
                        .entries
                        .map(
                          (entry) => GestureDetector(
                            onTap: () {
                              controller.changeNavIndex(index: entry.key);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(2.sp),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: controller.index == entry.key
                                      ? AppColors.primaryWhite
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.sp),
                                  child: Text(entry.value.toString()),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 14.w,
                  ),
                  child: controller.pages[controller.index],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Row _buildProfileShortStatistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.primaryLightGray),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("24"), Text("Items won")],
              ),
            ),
          ),
        ),

        SizedBox(width: 8.w),

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.primaryLightGray),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("£94,850"), Text("Total spent")],
              ),
            ),
          ),
        ),

        SizedBox(width: 8.w),

        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(color: AppColors.primaryLightGray),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("15"), Text("Favorite")],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildHeaderSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: CachedNetworkImage(
                width: 100.w,
                height: 100.h,
                fit: BoxFit.cover,
                imageUrl:
                    "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?cs=srgb&dl=pexels-italo-melo-881954-2379004.jpg&fm=jpg",
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(AppAssets.cameraInsideCircleIcon),
              ),
            ),
          ],
        ),
        SizedBox(width: 16.w),
        GetBuilder<BuyerProfilePageController>(
          init: BuyerProfilePageController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Get.width / 2.1,
                      child: TextField(
                        readOnly: !controller.editMode,
                        controller: TextEditingController(text: "Alex Morgan"),
                        decoration: InputDecoration(
                          enabledBorder: controller.editMode
                              ? OutlineInputBorder()
                              : InputBorder.none,
                          focusedBorder: controller.editMode
                              ? OutlineInputBorder()
                              : InputBorder.none,
                        ),
                      ),
                    ),

                    SizedBox(width: 16.w),
                    InkWell(
                      onTap: () {
                        // controller.toggleEditMode();
                        Get.toNamed(AppRoutes.editProfileRoute);
                      },
                      child: Icon(
                        controller.editMode ? Icons.save : Icons.edit_outlined,
                      ),
                    ),
                  ],
                ),
                Text(
                  "@alex_morgan",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.primaryBlack.withAlpha((255 * .6).round()),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 254.w,
                  height: 40.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Upgrade to pro. buyer",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: AppColors.primaryWhite,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  IconButton _buildMoreOptions() {
    return IconButton(
      onPressed: () {
        Get.bottomSheet(
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.r),
                  topRight: Radius.circular(6.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.lotDetailsRoute,
                          arguments: {"shouldWrapWithScaffold": true},
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.addInsideSquareIcon,
                            width: 30.w,
                            height: 30.h,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(9.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Create new listing",
                                    style: TextStyle(fontSize: 17.sp),
                                  ),
                                  Text(
                                    "Add a new item to your listing",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: AppColors.primaryBlack.withAlpha(
                                        (255 * .6).round(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.settingsRoute);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.settingsIcon,
                            width: 30.w,
                            height: 30.h,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(9.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Settings",
                                    style: TextStyle(fontSize: 17.sp),
                                  ),
                                  Text(
                                    "Update security, add payment method change currency ",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.primaryBlack.withAlpha(
                                        (255 * .6).round(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(SupportPage());
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.supportIcon,
                            width: 30.w,
                            height: 30.h,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(9.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Support",
                                    style: TextStyle(fontSize: 17.sp),
                                  ),
                                  Text(
                                    "Get instant Live support from admin",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.primaryBlack.withAlpha(
                                        (255 * .6).round(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(
                          Center(
                            child: Material(
                              color: Colors.transparent,
                              child: Container(
                                width: Get.width - 30.w,
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryWhite,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.logoutIcon,
                                          width: 24.w,
                                          height: 24.h,
                                        ),
                                        Text(
                                          "Log out",
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            color: AppColors.primaryDanger,
                                          ),
                                        ),

                                        Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: Icon(Icons.close),
                                        ),
                                      ],
                                    ),
                                    Divider(),

                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20.h),
                                      child: Text(
                                        "Do you want to log out your account?",
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: AppColors.primaryBlack
                                              .withAlpha((255 * .8).round()),
                                        ),
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryBlack,
                                              foregroundColor:
                                                  AppColors.primaryWhite,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              "No, keep me in",
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 12.w),

                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryDanger,
                                              foregroundColor:
                                                  AppColors.primaryWhite,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              "Yes, log out",
                                              style: TextStyle(fontSize: 14.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppAssets.logoutIcon,
                            width: 30.w,
                            height: 30.h,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(9.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Log out",
                                    style: TextStyle(fontSize: 17.sp),
                                  ),
                                  Text(
                                    "Exit from your account",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.primaryBlack.withAlpha(
                                        (255 * .6).round(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      icon: Icon(Icons.more_vert_outlined),
    );
  }
}
