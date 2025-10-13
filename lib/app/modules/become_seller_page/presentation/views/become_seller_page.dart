import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/controller/become_seller_page_controller.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

class BecomeSellerPage extends StatelessWidget {
  const BecomeSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  AppAssets.becomeSellerMessage,
                  width: 265.w,
                  height: 214.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 32.h,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.becomeSellerStepRoute);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlack,
                        foregroundColor: AppColors.primaryWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      child: Text(
                        "Get started",
                        style: TextStyle(fontSize: 17.sp),
                      ),
                    ),
                  ),
                ),

                _buildSelectState(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildSelectState() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GestureDetector(
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
              child: GetBuilder<BecomeSellerPageController>(
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
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 13.5.h,
                                horizontal: 12.5.w,
                              ),
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search...",
                              filled: true,
                              fillColor: AppColors.primaryBlack.withAlpha((255 * .06).round()),
                              border: InputBorder.none,
                            ),
                          ),


                          SizedBox(
                            height: 250.h,
                            width: double.infinity,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  if (controller.selectedIndex == index) {
                                    controller.selectIndex(-1);
                                  } else {
                                    controller.selectIndex(index);
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(14.sp),
                                  child: Row(
                                    children: [
                                      Text(
                                        controller.filteredStateList[index],
                                        style: TextStyle(fontSize: 17.sp),
                                      ),
                                      Spacer(),
                                      controller.selectedIndex == index
                                          ? Icon(Icons.check)
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 5.h),
                              itemCount: controller.filteredStateList.length,
                            ),
                          ),

                          SizedBox(height: 8.h),
                          Divider(
                            color: AppColors.primaryBlack.withAlpha(
                              (255 * .1).round(),
                            ),
                          ),
                          SizedBox(height: 8.h),
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
                              child: Text(
                                "Done",
                                style: TextStyle(fontSize: 17.sp),
                              ),
                            ),
                          ),
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
                  "Select",
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * .35).round(),
                    ),
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
      ),
    );
  }
}
