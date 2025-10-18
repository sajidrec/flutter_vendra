import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../controllers/sell_page_controller.dart';

class FinalTouchesPage extends StatelessWidget {
  const FinalTouchesPage({super.key});

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
              Text("Final touches", style: TextStyle(fontSize: 28.sp)),
              SizedBox(height: 8.h),
              Text(
                "Upload an attractive & clean thumbnail of your lot item, add tags to find your item in front of bidders.",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColors.primaryBlack.withAlpha((255 * .8).round()),
                ),
              ),

              SizedBox(height: 20.h),

              GestureDetector(
                onTap: () async {
                  await controller.pickThumbnailFile();
                },
                child: (controller.thumbnailFile?.files.isEmpty ?? true)
                    ? SvgPicture.asset(
                        AppAssets.uploadItemTumbMsgImg,
                        width: 371.w,
                        height: 371.h,
                      )
                    : SizedBox(
                        width: 371.w,
                        height: 371.h,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6.r),
                              child: Image.file(
                                File(
                                  controller.thumbnailFile?.files[0].path ?? "",
                                ),
                                fit: BoxFit.cover,
                                width: 371.w,
                                height: 371.h,
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                width: 139.w,
                                height: 48.h,
                                child: OutlinedButton(
                                  onPressed: () async {
                                    await controller.pickThumbnailFile();
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.primaryWhite,
                                    side: BorderSide(
                                      width: 1,
                                      color: AppColors.primaryWhite,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.r),
                                    ),
                                  ),
                                  child: Text(
                                    "Change",
                                    style: TextStyle(fontSize: 17.sp),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              ),

              SizedBox(height: 18.sp),

              Row(
                children: [
                  Text("Add Tags", style: TextStyle(fontSize: 17.sp)),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.tagsRoute);
                    },
                    icon: Icon(Icons.add),
                  ),
                ],
              ),

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
                  onPressed:
                      (controller.thumbnailFile?.files.isNotEmpty ?? false)
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
}
