import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';

import '../../../../core/constants/app_colors.dart';
import '../controllers/sell_page_controller.dart';

class UploadLotPhotoPage extends StatelessWidget {
  const UploadLotPhotoPage({super.key});

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
              Text("Upload your lot photo", style: TextStyle(fontSize: 28.sp)),
              SizedBox(height: 8.h),
              Text(
                "Upload minimum 3 photos and maximum 6. Attractive photos sells quickly.",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColors.primaryBlack.withAlpha((255 * .8).round()),
                ),
              ),
              SizedBox(height: 20.h),

              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(AppAssets.uploadMsgBoxImg),
              ),

              SizedBox(height: 16.h),

              SizedBox(
                height: 275.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: AppColors.primaryLightGray),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.image),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "HannahBusing_photos",
                                style: TextStyle(fontSize: 17.sp),
                              ),
                              Text("HannahBusing_Resume.pdf"),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "Click to view",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.delete),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemCount: 20,
                ),
              ),

              SizedBox(height: 16.h),
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
                  onPressed: () {},
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
