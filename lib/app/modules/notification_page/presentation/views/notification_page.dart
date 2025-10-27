import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/notification_page/presentation/controller/notification_page_controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: 16.sp),
              child: Text(
                "Read all",
                style: TextStyle(
                  color: AppColors.primaryPurple,
                  fontSize: 17.sp,
                ),
              ),
            ),
          ),
        ],
        title: Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 7.sp),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryGray.withAlpha((255 * .12).round()),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: GetBuilder<NotificationPageController>(
                  builder: (controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(2.r),
                            child: InkWell(
                              onTap: () {
                                controller.setCategoryIndex(0);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: controller.categoryIndex == 0
                                      ? AppColors.primaryWhite
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.sp,
                                    horizontal: 12.sp,
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.notificationCategoryList[0],
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(2.r),
                            child: InkWell(
                              onTap: () {
                                controller.setCategoryIndex(1);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: controller.categoryIndex == 1
                                      ? AppColors.primaryWhite
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.sp,
                                    horizontal: 12.sp,
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.notificationCategoryList[1],
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(2.r),
                            child: InkWell(
                              onTap: () {
                                controller.setCategoryIndex(2);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: controller.categoryIndex == 2
                                      ? AppColors.primaryWhite
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.sp,
                                    horizontal: 12.sp,
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.notificationCategoryList[2],
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(2.r),
                            child: InkWell(
                              onTap: () {
                                controller.setCategoryIndex(3);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: controller.categoryIndex == 3
                                      ? AppColors.primaryWhite
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(7.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.sp,
                                    horizontal: 12.sp,
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.notificationCategoryList[3],
                                      style: TextStyle(fontSize: 13.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
