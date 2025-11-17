import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/auctioner_profile_page/presentation/controllers/auctioner_profile_page_controller.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class AuctionerProfilePage extends StatelessWidget {
  const AuctionerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Auctioneer profile")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              children: [
                _buildHeader(),
                SizedBox(height: 24.h),
                _buildProfileStatsSection(),
                SizedBox(height: 24.h),
                _buildNavMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GetBuilder<AuctionerProfilePageController> _buildNavMenu() {
    return GetBuilder<AuctionerProfilePageController>(
      builder: (controller) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(
              color: AppColors.primaryBlack.withAlpha((255 * 0.1).round()),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          (entry) => Expanded(
                            child: GestureDetector(
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
                                    child: Center(
                                      child: Text(entry.value.toString()),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.w),
                child: controller.pages[controller.index],
              ),
            ],
          ),
        );
      },
    );
  }

  Container _buildProfileStatsSection() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryPurple,
        borderRadius: BorderRadius.circular(3.r),
      ),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "24",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.primaryWhite,
                  ),
                ),
                Text(
                  "Items",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 46.h,
              child: VerticalDivider(
                color: AppColors.primaryBlack.withAlpha((255 * .35).round()),
                thickness: 2,

                width: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "562",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.primaryWhite,
                  ),
                ),
                Text(
                  "Sold",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 46.h,
              child: VerticalDivider(
                color: AppColors.primaryBlack.withAlpha((255 * .35).round()),
                thickness: 2,
                width: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "£42.5k",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.primaryWhite,
                  ),
                ),
                Text(
                  "Earnings",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 46.h,
              child: VerticalDivider(
                color: AppColors.primaryBlack.withAlpha((255 * .35).round()),
                thickness: 2,

                width: 20,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "98%",
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.primaryWhite,
                  ),
                ),
                Text(
                  "Response rate",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.primaryWhite,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        GetBuilder<AuctionerProfilePageController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: Get.width / 2.1,
                      child: TextField(
                        readOnly: true,
                        controller: TextEditingController(
                          text: "Example Business",
                        ),
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),

                    // Text(
                    //   "Example Business",
                    //   style: TextStyle(
                    //     fontSize: 22.sp,
                    //     fontWeight: FontWeight.w700,
                    //   ),
                    // ),
                    SizedBox(width: 16.w),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.notifications_active,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                  ],
                ),
                Text(
                  "@example_business",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.primaryBlack.withAlpha((255 * .6).round()),
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.verifiedBatchIcon),
                    SizedBox(width: 8.w),
                    SvgPicture.asset(AppAssets.topSellerBatchIcon),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
