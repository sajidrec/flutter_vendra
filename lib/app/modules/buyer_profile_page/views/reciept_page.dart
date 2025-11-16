import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

class RecieptPage extends StatelessWidget {
  const RecieptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.recieptDetailsRoute);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.watchImg,
                        width: 80.w,
                        height: 80.h,
                      ),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wrist Watch",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                            Text(
                              "Vintage Rolex Submariner Watch, 1980s",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.primaryGray,
                              ),
                            ),
                            Text("£2,400", style: TextStyle(fontSize: 17.sp)),
                          ],
                        ),
                      ),
                      Text(
                        "17 Sep",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.primaryGray,
                        ),
                      ),
                    ],
                  ),
                ),
                childCount: 10,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 12.h)),
          ],
        ),
      ),
    );
  }
}
