import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/on_boarding_page/controller/on_boarding_page_controller.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.onBoardingRoute2);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.primaryBlack),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              child: Text(
                "Next",
                style: TextStyle(
                  color: AppColors.primaryBlack,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Progress bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 73.w, vertical: 20.h),
                child: LinearProgressIndicator(
                  value: 0.25,
                  color: AppColors.primaryBlack,
                  backgroundColor: AppColors.nural6,
                  minHeight: 2.h,
                ),
              ),

              SizedBox(height: 31.h),

              /// Carousel
              _buildCarousel(),

              SizedBox(height: 47.h),

              /// Text content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover rare finds",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Bid on authenticated luxury—from vintage Rolex to classic Ferraris. "
                      "Uncover treasures you won't find anywhere else.",
                      style: TextStyle(fontSize: 17, color: AppColors.nutral80),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Carousel Builder
  Padding _buildCarousel() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<OnBoardingPageController>(
        builder: (controller) {
          return Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 370 / 466,
                  onPageChanged: (index, reason) =>
                      controller.setCurrentIndex(index),
                ),
                items: controller.imgList.map((img) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: 466.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Image.asset(img, fit: BoxFit.cover),
                      );
                    },
                  );
                }).toList(),
              ),

              /// Dots Indicator
              Positioned(
                bottom: 20.h,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.imgList.asMap().entries.map((entry) {
                    return Container(
                      width: 6.w,
                      height: 6.h,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.currentIndex == entry.key
                            ? AppColors.primaryBlack
                            : AppColors.nutral10,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
