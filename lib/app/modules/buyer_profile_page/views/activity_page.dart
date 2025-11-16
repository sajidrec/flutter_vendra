import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAuctionWon(),
              SizedBox(height: 24.h),
              _buildOngoingBid(),
              SizedBox(height: 24.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.purchaseIcon,
                        width: 60.w,
                        height: 60.h,
                      ),
                      SizedBox(width: 14.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Purchased Completed",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                            Text(
                              "Designer Handbag",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.primaryGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "5h ago",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.primaryGray,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Paid: £1,200",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.primaryGoldenYellow,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildOngoingBid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppAssets.hammerIcon, width: 60.w, height: 60.h),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ongoing Bid", style: TextStyle(fontSize: 17.sp)),
                  Text(
                    "Abstract Art Painting",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.primaryGray,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "5h ago",
              style: TextStyle(fontSize: 13.sp, color: AppColors.primaryGray),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          "Current bid: £950",
          style: TextStyle(fontSize: 17.sp, color: AppColors.primaryPurple),
        ),
      ],
    );
  }

  Column _buildAuctionWon() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppAssets.trophyGreenIcon,
              width: 60.w,
              height: 60.h,
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Auction Won", style: TextStyle(fontSize: 17.sp)),
                  Text(
                    "Vintage Watch Collection ",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.primaryGray,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "2h ago",
              style: TextStyle(fontSize: 13.sp, color: AppColors.primaryGray),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          "Winning bid: £2,400",
          style: TextStyle(fontSize: 17.sp, color: AppColors.primarySuccess),
        ),
      ],
    );
  }
}
