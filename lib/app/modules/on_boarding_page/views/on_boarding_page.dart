import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/on_boarding_page/controller/on_boarding_page_controller.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
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

              _buildCarousel(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildCarousel() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
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
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(),
                        child: Image.asset(img, fit: BoxFit.cover),
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned(
                bottom: 20.h, // adjust for top overlay
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.imgList.asMap().entries.map((entry) {
                    return Container(
                      width: 6.w,
                      height: 6.h,
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
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
