import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../controller/become_seller_page_controller.dart';
import '../controller/become_seller_step_page_controller.dart';

class DocumentUploadPageWidget extends StatelessWidget {
  const DocumentUploadPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<BecomeSellerStepPageController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "We need to Verify your Business Documents that it’s you",
                style: TextStyle(fontSize: 28.sp),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () async {
                  await controller.pickFiles();
                },
                child: SvgPicture.asset(
                  AppAssets.uploadMsgBoxImg,
                  width: double.infinity,
                  height: 128.h,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 286.h,
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryBlack.withAlpha(
                          (255 * .1).round(),
                        ),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.insert_drive_file),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(16.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Tax ID", style: TextStyle(fontSize: 15.sp)),
                              Text(
                                controller.pickedFileList.isNotEmpty
                                    ? path.basename(
                                        controller.pickedFileList[index]!.path,
                                      )
                                    : "No file",
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              InkWell(
                                onTap: () {
                                  OpenFile.open(
                                    controller.pickedFileList[index]!.path,
                                  );
                                },
                                child: Text(
                                  "Click to view".toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryBlack,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            controller.removePickedFileAt(index);
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                      // leading: ,
                      // title:
                      // trailing:
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemCount: controller.pickedFileList.length,
                ),
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
              SizedBox(height: 16.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.pickedFileList.isEmpty
                      ? null
                      : () {
                          Get.dialog(
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Center(
                                child: Material(
                                  color: Colors.transparent,
                                  child: SingleChildScrollView(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryWhite,
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.w),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Spacer(),
                                                IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: AppColors
                                                        .primaryBlack
                                                        .withAlpha(
                                                          (255 * .6).round(),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "Application has been submitted successfully.",
                                              style: TextStyle(
                                                fontSize: 22.sp,
                                                color: AppColors.primaryBlack,
                                              ), // use Material text style
                                            ),
                                            SizedBox(height: 16.h),
                                            Text(
                                              "Your application is in under review. We will inform you within next 48 hours via your registered email. Keep patience and  keep in touch.",
                                              style: TextStyle(
                                                fontSize: 17.sp,
                                                color: AppColors.primaryBlack
                                                    .withAlpha(
                                                      (255 * .8).round(),
                                                    ),
                                              ), // use Material text style
                                            ),
                                            SizedBox(height: 24.h),
                                            SizedBox(
                                              width: double.infinity,
                                              child: OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  foregroundColor:
                                                      AppColors.primaryBlack,

                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4.r,
                                                        ),
                                                  ),
                                                ),

                                                onPressed: () async {
                                                  await Get.find<
                                                        BecomeSellerPageController
                                                      >()
                                                      .setVerifiedSeller(true);

                                                  Get.back();
                                                },
                                                child: Text(
                                                  "Done",
                                                  style: TextStyle(
                                                    fontSize: 17.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            barrierDismissible: true,
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlack,
                    foregroundColor: AppColors.primaryWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  child: Text("Submit", style: TextStyle(fontSize: 17.sp)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
