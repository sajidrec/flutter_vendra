import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/controllers/seller_profile_page_controller.dart';

class SellerProfilePage extends StatelessWidget {
  const SellerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Profile",
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
          ),
          backgroundColor: AppColors.primaryWhite,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: GetBuilder<SellerProfilePageController>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    _buildHeaderSection(),
                    SizedBox(height: 25.h),
                    _buildProfileShortStatistics(),
                    SizedBox(height: 24.h),
                    _buildNavMenu(controller),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Container _buildNavMenu(SellerProfilePageController controller) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: AppColors.primaryBlack.withAlpha((255 * 0.1).round()),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
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
                          padding: EdgeInsets.all(3.sp),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: controller.pages[controller.index],
          ),
        ],
      ),
    );
  }

  Container _buildProfileShortStatistics() {
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

  Row _buildHeaderSection() {
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
                    "https://thumbs.dreamstime.com/b/unknown-hooded-computer-hacker-smoke-background-hooded-computer-hacker-smoke-background-104727196.jpg",
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Example Business",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 16.w),
                InkWell(onTap: () {}, child: Icon(Icons.edit_outlined)),
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
        ),
      ],
    );
  }
}
