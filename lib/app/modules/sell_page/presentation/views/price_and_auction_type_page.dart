import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';

import '../../../../core/constants/app_colors.dart';
import '../controllers/sell_page_controller.dart';

class PriceAndAuctionTypePage extends StatelessWidget {
  const PriceAndAuctionTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellPageController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Pricing & auction type", style: TextStyle(fontSize: 28.sp)),
              SizedBox(height: 8.h),
              Text(
                "Standard pricing attract bidders & get sells more.",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColors.primaryBlack.withAlpha((255 * .8).round()),
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                "Set Starting Price",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),

              TextField(
                controller: controller.auctionPriceTec,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  controller.auctionPrice = int.parse(value);
                },
                decoration: InputDecoration(
                  prefixText: "£",
                  prefixStyle: TextStyle(fontSize: 17.sp),
                  suffixIcon: SizedBox(
                    width: 100.w,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.decreaseAuctionPrice();
                          },
                          child: SvgPicture.asset(
                            AppAssets.circularMinusIcon,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                        SizedBox(width: 32.w),
                        InkWell(
                          onTap: () {
                            controller.increaseAuctionPrice();
                          },
                          child: SvgPicture.asset(
                            AppAssets.circularPlusIcon,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),
              Text(
                "Select Auction Type",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: controller.timeAuctionMode
                            ? AppColors.primaryPurple.withAlpha(
                                (255 * .07).round(),
                              )
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6.r),
                        border: BoxBorder.all(
                          color: controller.timeAuctionMode
                              ? AppColors.primaryPurple
                              : AppColors.primaryBlack.withAlpha(
                                  (255 * .10).round(),
                                ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Spacer(),
                                Switch(
                                  value: controller.timeAuctionMode,
                                  onChanged: (value) {
                                    controller.toggleTimeAuctionMode();
                                  },
                                  activeTrackColor: AppColors.primaryPurple,
                                  inactiveTrackColor: AppColors.primaryBlack
                                      .withAlpha((255 * .06).round()),
                                  inactiveThumbColor: AppColors.primaryWhite,
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "Timed auction",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 11.w),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: controller.liveAuctionMode
                            ? AppColors.primaryPurple.withAlpha(
                                (255 * .07).round(),
                              )
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6.r),
                        border: BoxBorder.all(
                          color: controller.liveAuctionMode
                              ? AppColors.primaryPurple
                              : AppColors.primaryBlack.withAlpha(
                                  (255 * .10).round(),
                                ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Spacer(),
                                Switch(
                                  value: controller.liveAuctionMode,
                                  onChanged: (value) {
                                    controller.toggleLiveAuctionMode();
                                  },
                                  activeTrackColor: AppColors.primaryPurple,
                                  inactiveTrackColor: AppColors.primaryBlack
                                      .withAlpha((255 * .06).round()),
                                  inactiveThumbColor: AppColors.primaryWhite,
                                  trackOutlineColor: WidgetStatePropertyAll(
                                    Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "LIVE auction",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              controller.timeAuctionMode
                  ? _buildTimePickerSection(controller, context)
                  : SizedBox.shrink(),

              RichText(
                text: TextSpan(
                  style: TextStyle(color: AppColors.primaryBlack),
                  children: [
                    TextSpan(text: "By continue, you agree to the Gavellia "),
                    TextSpan(
                      text: "Terms of Service and ",
                      style: TextStyle(
                        color: AppColors.primaryPeriwinkle,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text:
                          "to occasionally receive emails from us. Please read our ",
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(
                        color: AppColors.primaryPeriwinkle,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(text: " to learn how use your personal data."),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.pickedFiles.length >= 3
                      ? () {
                          controller.increaseProgressIndex();
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlack,
                    foregroundColor: AppColors.primaryWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),

                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  Column _buildTimePickerSection(
    SellPageController controller,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Start date",
          style: TextStyle(fontSize: 13.sp, color: AppColors.primaryBlack),
        ),
        TextField(
          controller: controller.startDateTec,
          style: TextStyle(
            color: AppColors.primaryBlack.withAlpha((255 * .35).round()),
          ),
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.calendar_today_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
          ),
          readOnly: true,
          onTap: () async {
            await controller.pickStartDateForTimedAuction(context);
          },
        ),

        Text(
          "Based on the selected date your lot will get live to the bidders",
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.primaryBlack.withAlpha((255 * .6).round()),
          ),
        ),
        SizedBox(height: 8.h),

        Text(
          "End Date",
          style: TextStyle(fontSize: 13.sp, color: AppColors.primaryBlack),
        ),

        TextField(
          controller: controller.endDateTec,
          style: TextStyle(
            color: AppColors.primaryBlack.withAlpha((255 * .35).round()),
          ),
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.calendar_today_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
          ),
          readOnly: true,
          onTap: () async {
            await controller.pickEndDateForTimedAuction(context);
          },
        ),
        Text(
          "Select the date when you want to end the timeline of your auction",
          style: TextStyle(
            fontSize: 13.sp,
            color: AppColors.primaryBlack.withAlpha((255 * .6).round()),
          ),
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}
