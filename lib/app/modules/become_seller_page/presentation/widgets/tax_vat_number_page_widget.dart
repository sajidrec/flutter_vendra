import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../controller/become_seller_step_page_controller.dart';

class TaxVatNumberPageWidget extends StatelessWidget {
  const TaxVatNumberPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: SingleChildScrollView(
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
                    SizedBox(height: 24.h),
                    // Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColors.primaryWhite,
                          backgroundColor: AppColors.primaryBlack,
                        ),
                        onPressed: () {
                          if (controller.idNumberTec.text.isNotEmpty &&
                              controller
                                      .selectedCountryForDocumentVerification !=
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
