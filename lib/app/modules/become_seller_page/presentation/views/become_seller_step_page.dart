import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../controller/become_seller_step_page_controller.dart';

import 'package:path/path.dart' as path;

class BecomeSellerStepPage extends StatelessWidget {
  BecomeSellerStepPage({super.key});

  late final List _pages = [
    _buildPersonalInformationPage(),
    _buildBusinessInformationPage(),

    _buildTaxVatNumberPage(),

    _buildDocumentUploadPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<BecomeSellerStepPageController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressBar(
                    progressedIndex: controller.progressedIndex,
                    progressLength: _pages.length,
                    controller: controller,
                  ),
                  _pages[controller.progressedIndex - 1],
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Padding _buildTaxVatNumberPage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<BecomeSellerStepPageController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Business TAX ID/VAT number required for verification",
                  style: TextStyle(fontSize: 28.sp),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Select ID Type",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.primaryBlack,
                  ),
                ),
                SizedBox(height: 16.h),

                _buildVerificationDocumentTypeButton(
                  controller,
                  documentTypeName: 'EIN',
                ),
                SizedBox(height: 8.h),
                _buildVerificationDocumentTypeButton(
                  controller,
                  documentTypeName: 'SSN',
                ),
                SizedBox(height: 8.h),
                _buildVerificationDocumentTypeButton(
                  controller,
                  documentTypeName: 'VAT',
                ),
                SizedBox(height: 8.h),
                _buildVerificationDocumentTypeButton(
                  controller,
                  documentTypeName: 'Other',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  GestureDetector _buildVerificationDocumentTypeButton(
    BecomeSellerStepPageController controller, {
    required String documentTypeName,
  }) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close),
                      ),
                      Spacer(),
                      Text(
                        documentTypeName,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text("ID Number"),
                  TextFormField(
                    controller: controller.idNumberTec,
                    decoration: InputDecoration(
                      hintText: "GB123456789",
                      hintStyle: TextStyle(
                        color: AppColors.primaryBlack.withAlpha(
                          (255 * .35).round(),
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 17.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.r),
                        borderSide: BorderSide(
                          color: AppColors.primaryBlack.withAlpha(
                            (255 * .01).round(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text("Country of Registration"),
                  _buildSelectCountryForDocumentVerification(controller),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: AppColors.primaryWhite,
                        backgroundColor: AppColors.primaryBlack,
                      ),
                      onPressed: () {
                        if (controller.idNumberTec.text.isNotEmpty &&
                            controller.selectedCountryForDocumentVerification !=
                                null) {
                          Get.back();
                          controller.increaseProgressIndex();
                        } else {
                          Get.snackbar("Give submit profile info", "");
                        }
                      },
                      child: Text("Done"),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryBlack.withAlpha((255 * .10).round()),
          ),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 26.h),
          child: Row(
            children: [
              Text(documentTypeName),
              Spacer(),
              SvgPicture.asset(
                AppAssets.forwardArrowIcon,
                width: 20.w,
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildPersonalInformationPage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<BecomeSellerStepPageController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Personal information", style: TextStyle(fontSize: 28.sp)),
              SizedBox(height: 20.h),
              Text(
                "First Name",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextFormField(
                controller: controller.firstNameTec,
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.setFirstNameFilled(false);
                  } else {
                    controller.setFirstNameFilled(true);
                  }
                },
                decoration: InputDecoration(
                  hintText: "e.g. Steve",
                  hintStyle: TextStyle(
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * .35).round(),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 17.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .01).round(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Last Name",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextFormField(
                controller: controller.lastNameTec,
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.setLastNameFilled(false);
                  } else {
                    controller.setLastNameFilled(true);
                  }
                },
                decoration: InputDecoration(
                  hintText: "e.g. Moss",
                  hintStyle: TextStyle(
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * .35).round(),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 17.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .01).round(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 330.h),
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
                  onPressed:
                      (controller.firstNameFilled && controller.lastNameFilled)
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
                  child: Text("Continue", style: TextStyle(fontSize: 17.sp)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding _buildDocumentUploadPage() {
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
                  onPressed: controller.pickedFileList.isEmpty ? null : () {},
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

  Padding _buildBusinessInformationPage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<BecomeSellerStepPageController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Business information", style: TextStyle(fontSize: 28.sp)),

              SizedBox(height: 20.h),

              Text(
                "Business Name",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextFormField(
                controller: controller.businessNameTec,
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.setBusinessNameFilled(false);
                  } else {
                    controller.setBusinessNameFilled(true);
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter your business name",
                  hintStyle: TextStyle(
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * .35).round(),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 17.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .01).round(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Business Type",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextFormField(
                controller: controller.businessTypeTec,
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.setBusinessTypeFilled(false);
                  } else {
                    controller.setBusinessTypeFilled(true);
                  }
                },
                decoration: InputDecoration(
                  hintText: "e.g. LLC, Inc",
                  hintStyle: TextStyle(
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * .35).round(),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 17.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .01).round(),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),
              Text("Business Address", style: TextStyle(fontSize: 17.sp)),
              SizedBox(height: 8.h),
              Text(
                "Street",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextFormField(
                controller: controller.streetTec,
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.setStreetFilled(false);
                  } else {
                    controller.setStreetFilled(true);
                  }
                },
                decoration: InputDecoration(
                  hintText: "e.g. 123 Main Street, Suite 400",
                  hintStyle: TextStyle(
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * .35).round(),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 17.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .01).round(),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),
              Text(
                "City",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              TextFormField(
                controller: controller.cityTec,
                onChanged: (value) {
                  if (value.isEmpty) {
                    controller.setCityFilled(false);
                  } else {
                    controller.setCityFilled(true);
                  }
                },
                decoration: InputDecoration(
                  hintText: "e.g. New York",
                  hintStyle: TextStyle(
                    color: AppColors.primaryBlack.withAlpha(
                      (255 * .35).round(),
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 17.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.r),
                    borderSide: BorderSide(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .01).round(),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              Text(
                "State (Optional)",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),

              _buildSelectState(controller),

              SizedBox(height: 24.h),
              Text(
                "Country/Region",
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryBlack,
                ),
              ),
              _buildSelectCountry(controller),

              SizedBox(height: 36.h),

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
                  onPressed:
                      (controller.businessNameFilled &&
                          controller.businessTypeFilled &&
                          controller.streetFilled &&
                          controller.cityFilled &&
                          controller.selectedCountry != null)
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
                  child: Text("Continue", style: TextStyle(fontSize: 17.sp)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding _buildProgressBar({
    required int progressedIndex,
    required int progressLength,
    required BecomeSellerStepPageController controller,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (controller.progressedIndex > 1) {
                controller.decreaseProgressIndex();
              }
              if (controller.progressedIndex == 1) {
                Get.back();
              }
            },
            child: SvgPicture.asset(
              AppAssets.backArrowIcon,
              width: 32.w,
              height: 32.h,
              colorFilter: ColorFilter.mode(
                AppColors.primaryBlack,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 25.w),
          Expanded(
            child: LinearProgressIndicator(
              value: progressedIndex / progressLength,
              color: AppColors.primaryBlack,
              backgroundColor: AppColors.nural6,
              minHeight: 2.h,
            ),
          ),
          SizedBox(width: 25.w),
          Text(
            "$progressedIndex/$progressLength",
            style: TextStyle(fontSize: 15.sp),
          ),
        ],
      ),
    );
  }

  GestureDetector _buildSelectState(BecomeSellerStepPageController controller) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: GetBuilder<BecomeSellerStepPageController>(
              builder: (controller) {
                return SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.close),
                            ),
                            Spacer(),
                            Text(
                              "State",
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        TextField(
                          onChanged: (query) {
                            if (controller.stateList.isNotEmpty) {
                              controller.searchStates(query);
                            }
                          },
                          controller: controller.searchStateTec,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 13.5.h,
                              horizontal: 12.5.w,
                            ),
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search...",
                            filled: true,
                            fillColor: AppColors.primaryBlack.withAlpha(
                              (255 * .06).round(),
                            ),
                            border: InputBorder.none,
                          ),
                        ),

                        Flexible(
                          // height: 250.h,
                          // width: double.infinity,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.filteredStateList.length,
                            itemBuilder: (context, index) {
                              final state = controller.filteredStateList[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.selectState(state);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(14.sp),
                                  child: Row(
                                    children: [
                                      Text(
                                        state,
                                        style: TextStyle(fontSize: 17.sp),
                                      ),
                                      Spacer(),
                                      controller.isSelected(state)
                                          ? Icon(Icons.check)
                                          : SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        // SizedBox(height: 8.h),
                        Divider(
                          color: AppColors.primaryBlack.withAlpha(
                            (255 * .1).round(),
                          ),
                        ),
                        // SizedBox(height: 8.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlack,
                              foregroundColor: AppColors.primaryWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Expanded(
                              child: Text(
                                "Done",
                                style: TextStyle(fontSize: 17.sp),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,

          border: Border.all(
            color: AppColors.primaryBlack.withAlpha((255 * .10).round()),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 17.h),
              child: Text(
                controller.selectedState == null
                    ? "Select"
                    : controller.selectedState ?? "",
                style: TextStyle(
                  fontSize: 17.sp,
                  color: controller.selectedState == null
                      ? AppColors.primaryBlack.withAlpha((255 * .35).round())
                      : AppColors.primaryBlack,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 14.w),
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: SvgPicture.asset(
                  AppAssets.forwardArrowIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector _buildSelectCountry(
    BecomeSellerStepPageController controller,
  ) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: GetBuilder<BecomeSellerStepPageController>(
              builder: (controller) {
                return SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(Icons.close),
                            ),
                            const Spacer(),
                            Text(
                              "Country",
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        SizedBox(height: 16.h),

                        // Search
                        TextField(
                          onChanged: (query) {
                            controller.searchCountries(query);
                          },
                          controller: controller.searchCountryTec,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 13.5.h,
                              horizontal: 12.5.w,
                            ),
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search...",
                            filled: true,
                            fillColor: AppColors.primaryBlack.withAlpha(
                              (255 * .06).round(),
                            ),
                            border: InputBorder.none,
                          ),
                        ),

                        // List of countries
                        Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: controller.filteredCountryList.length,
                            itemBuilder: (context, index) {
                              final country =
                                  controller.filteredCountryList[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.selectCountry(country);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(14.sp),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          50.r,
                                        ),

                                        child: SizedBox(
                                          height: 24.h,
                                          width: 24.h,
                                          child: CountryFlag.fromCountryCode(
                                            country['code'],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Text(
                                        country['name'],
                                        style: TextStyle(fontSize: 17.sp),
                                      ),
                                      const Spacer(),
                                      controller.isCountrySelected(country)
                                          ? const Icon(Icons.check)
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        Divider(
                          color: AppColors.primaryBlack.withAlpha(
                            (255 * .1).round(),
                          ),
                        ),

                        // Done button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryBlack,
                              foregroundColor: AppColors.primaryWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            onPressed: () => Get.back(),
                            child: Text(
                              "Done",
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryWhite,
          border: Border.all(
            color: AppColors.primaryBlack.withAlpha((255 * .10).round()),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 17.h),
              child: Row(
                children: [
                  if (controller.selectedCountry != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: SizedBox(
                        width: 24.w,
                        height: 24.h,
                        child: CountryFlag.fromCountryCode(
                          controller.selectedCountry!['code'],
                          // width: 28.w,
                          // height: 20.h,
                          // borderRadius: 4,
                        ),
                      ),
                    ),
                  if (controller.selectedCountry != null) SizedBox(width: 8.w),
                  Text(
                    controller.selectedCountry == null
                        ? "Select"
                        : controller.selectedCountry!['name'],
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: controller.selectedCountry == null
                          ? AppColors.primaryBlack.withAlpha(
                              (255 * .35).round(),
                            )
                          : AppColors.primaryBlack,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(right: 14.w),
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: SvgPicture.asset(
                  AppAssets.forwardArrowIcon,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GetBuilder _buildSelectCountryForDocumentVerification(
    BecomeSellerStepPageController controller,
  ) {
    return GetBuilder<BecomeSellerStepPageController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            Get.bottomSheet(
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
                child: GetBuilder<BecomeSellerStepPageController>(
                  builder: (controller) {
                    return SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => Get.back(),
                                  icon: const Icon(Icons.close),
                                ),
                                const Spacer(),
                                Text(
                                  "Country",
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                            SizedBox(height: 16.h),

                            // Search
                            TextField(
                              onChanged: (query) {
                                controller
                                    .searchCountriesForDocumentVerification(
                                      query,
                                    );
                              },
                              controller: controller
                                  .searchCountryForDocumentVerificationTec,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 13.5.h,
                                  horizontal: 12.5.w,
                                ),
                                prefixIcon: const Icon(Icons.search),
                                hintText: "Search...",
                                filled: true,
                                fillColor: AppColors.primaryBlack.withAlpha(
                                  (255 * .06).round(),
                                ),
                                border: InputBorder.none,
                              ),
                            ),

                            // List of countries
                            Flexible(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller
                                    .filteredCountryListForDocumentVerification
                                    .length,
                                itemBuilder: (context, index) {
                                  var country = controller
                                      .filteredCountryListForDocumentVerification[index];
                                  return GestureDetector(
                                    onTap: () {
                                      controller
                                          .selectCountryForDocumentVerification(
                                            country,
                                          );
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(14.sp),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              50.r,
                                            ),

                                            child: SizedBox(
                                              height: 24.h,
                                              width: 24.h,
                                              child:
                                                  CountryFlag.fromCountryCode(
                                                    country['code'],
                                                  ),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Text(
                                            country['name'],
                                            style: TextStyle(fontSize: 17.sp),
                                          ),
                                          const Spacer(),
                                          controller
                                                  .isCountrySelectedForDocumentVerification(
                                                    country,
                                                  )
                                              ? const Icon(Icons.check)
                                              : const SizedBox.shrink(),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            Divider(
                              color: AppColors.primaryBlack.withAlpha(
                                (255 * .1).round(),
                              ),
                            ),

                            // Done button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryBlack,
                                  foregroundColor: AppColors.primaryWhite,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  "Done",
                                  style: TextStyle(fontSize: 17.sp),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              border: Border.all(
                color: AppColors.primaryBlack.withAlpha((255 * .10).round()),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 17.h,
                  ),
                  child: Row(
                    children: [
                      if (controller.selectedCountryForDocumentVerification !=
                          null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: CountryFlag.fromCountryCode(
                              controller
                                  .selectedCountryForDocumentVerification!['code'],
                            ),
                          ),
                        ),
                      if (controller.selectedCountryForDocumentVerification !=
                          null)
                        SizedBox(width: 8.w),
                      Text(
                        controller.selectedCountryForDocumentVerification ==
                                null
                            ? "Select"
                            : controller
                                  .selectedCountryForDocumentVerification!['name'],
                        style: TextStyle(
                          fontSize: 17.sp,
                          color:
                              controller
                                      .selectedCountryForDocumentVerification ==
                                  null
                              ? AppColors.primaryBlack.withAlpha(
                                  (255 * .35).round(),
                                )
                              : AppColors.primaryBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: SvgPicture.asset(
                      AppAssets.forwardArrowIcon,
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
