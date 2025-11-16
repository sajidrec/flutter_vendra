import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

class RecieptDetailsPage extends StatelessWidget {
  const RecieptDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Receipt",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item", style: TextStyle(fontSize: 13.sp)),
                _buildItemView(),
                SizedBox(height: 16.h),
                Divider(),
                _buildAuctioneer(),
                Divider(),
                SizedBox(height: 16.h),
                Text("Payment Summary", style: TextStyle(fontSize: 13.sp)),
                SizedBox(height: 16.h),

                _buildPaymentSummary(),

                SizedBox(height: 18.h),

                Divider(),

                _buildShippingInfo(),

                Divider(),

                _buildTransactionDetails(),

                Divider(),

                SizedBox(height: 16.h),

                _buildWhatsNew(),

                Divider(),

                SizedBox(height: 24.h),

                _buildDownloadPDFButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildWhatsNew() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("What’s Next", style: TextStyle(fontSize: 13.sp)),
        SizedBox(height: 16.h),

        SvgPicture.asset(AppAssets.whatsNextImg),

        SizedBox(height: 16.h),
      ],
    );
  }

  ElevatedButton _buildDownloadPDFButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryBlack,
        foregroundColor: AppColors.primaryWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.downloadIcon),
          SizedBox(width: 16.w),
          Text("Download PDF", style: TextStyle(fontSize: 17.sp)),
        ],
      ),
    );
  }

  Column _buildTransactionDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Transaction Details", style: TextStyle(fontSize: 13.sp)),
        SizedBox(height: 16.h),

        Row(
          children: [
            Text(
              "Order ID",
              style: TextStyle(
                fontSize: 17.sp,
                color: AppColors.primaryBlack.withValues(alpha: 0.8),
              ),
            ),
            Spacer(),
            Text("#AUC-2025-789456", style: TextStyle(fontSize: 17.sp)),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Text(
              "Payment method",
              style: TextStyle(
                fontSize: 17.sp,
                color: AppColors.primaryBlack.withValues(alpha: 0.8),
              ),
            ),
            Spacer(),
            Text("···· 4532", style: TextStyle(fontSize: 17.sp)),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Text(
              "Date",
              style: TextStyle(
                fontSize: 17.sp,
                color: AppColors.primaryBlack.withValues(alpha: 0.8),
              ),
            ),
            Spacer(),
            Text("Sep 17,2025 at 3:42 PM", style: TextStyle(fontSize: 17.sp)),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Text(
              "Auction end",
              style: TextStyle(
                fontSize: 17.sp,
                color: AppColors.primaryBlack.withValues(alpha: 0.8),
              ),
            ),
            Spacer(),
            Text("Sep 17,2025 at 3:40 PM", style: TextStyle(fontSize: 17.sp)),
          ],
        ),

        SizedBox(height: 16.h),
      ],
    );
  }

  Column _buildShippingInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Shipping Information", style: TextStyle(fontSize: 13.sp)),
        SizedBox(height: 16.h),

        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryPurple.withValues(alpha: .07),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8),
            child: Row(
              children: [
                SvgPicture.asset(AppAssets.planeIcon),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Express Shipping", style: TextStyle(fontSize: 16.sp)),
                    Text(
                      "Estimated delivery: 2-3 business days",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.primaryPurple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column _buildPaymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Winning bid",
              style: TextStyle(
                fontSize: 17.sp,
                color: AppColors.primaryBlack.withValues(alpha: 0.8),
              ),
            ),
            Spacer(),
            Text("£2,400", style: TextStyle(fontSize: 17.sp)),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Text(
              "Buyer’s premium (10%)",
              style: TextStyle(
                fontSize: 17.sp,
                color: AppColors.primaryBlack.withValues(alpha: 0.8),
              ),
            ),
            Spacer(),
            Text("£240", style: TextStyle(fontSize: 17.sp)),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Text(
              "Shipping",
              style: TextStyle(
                fontSize: 17.sp,
                color: AppColors.primaryBlack.withValues(alpha: 0.8),
              ),
            ),
            Spacer(),
            Text("£29", style: TextStyle(fontSize: 17.sp)),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Text(
              "TAX",
              style: TextStyle(
                fontSize: 17.sp,
                color: AppColors.primaryBlack.withValues(alpha: 0.8),
              ),
            ),
            Spacer(),
            Text("£125", style: TextStyle(fontSize: 17.sp)),
          ],
        ),
        Divider(color: AppColors.primaryBlack),
        Row(
          children: [
            Text(
              "Total Paid",
              style: TextStyle(
                fontSize: 17.sp,
                color: AppColors.primaryBlack.withValues(alpha: 0.8),
              ),
            ),
            Spacer(),
            Text(
              "£2,893",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  Column _buildAuctioneer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Auctioneer", style: TextStyle(fontSize: 13.sp)),

        SizedBox(height: 16.h),

        Row(
          children: [
            SizedBox(
              height: 52.h,
              width: 52.w,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://wallpapers.com/images/hd/letter-p-gold-0t63xvvp6g6i3knt.jpg",
                ),
              ),
            ),

            SizedBox(width: 16.w),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pristine Auction", style: TextStyle(fontSize: 17.sp)),
                Text(
                  "New York, USA",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.primaryBlack.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),

            Spacer(),

            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.messageRoute);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(
                    color: AppColors.primaryBlack.withValues(alpha: .1),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 12.h,
                  ),
                  child: Text("Contact"),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 16.h),
      ],
    );
  }

  Row _buildItemView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(AppAssets.watchImg, width: 80.w, height: 80.h),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Wrist Watch", style: TextStyle(fontSize: 17.sp)),
              Text(
                "Vintage Rolex Submariner Watch, 1980s",
                style: TextStyle(fontSize: 13.sp, color: AppColors.primaryGray),
              ),
              Text(
                "£2,400",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColors.primarySuccess,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "17 Sep",
              style: TextStyle(fontSize: 13.sp, color: AppColors.primaryGray),
            ),
          ],
        ),
      ],
    );
  }
}
