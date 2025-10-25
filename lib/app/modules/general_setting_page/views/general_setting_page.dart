import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/general_setting_page/controllers/general_setting_page_controller.dart';

class GeneralSettingPage extends StatelessWidget {
  const GeneralSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryWhite,
          centerTitle: true,
          title: Text("General"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                _buildBusinessInformationForm(),
                SizedBox(height: 15.h),
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
                      "Save changes",
                      style: TextStyle(fontSize: 17.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildBusinessInformationForm() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: GetBuilder<GeneralSettingPageController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Business information",
                  style: GoogleFonts.ptSerif(fontSize: 28.sp),
                ),
                Text(
                  "Display your business information so that buyer can reach you easily.",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.primaryBlack.withAlpha((255 * .8).round()),
                  ),
                ),

                SizedBox(height: 24.h),

                _buildInputField(
                  hintText: 'Enter your auction house name',
                  inputText: 'Shop',
                  controller: controller.shopNameTEC,
                ),
                SizedBox(height: 16.h),
                _buildInputField(
                  hintText: 'Enter location',
                  inputText: 'Location',
                  controller: controller.locationTEC,
                ),
                SizedBox(height: 16.h),
                _buildInputField(
                  hintText: 'Contact email address',
                  inputText: 'Email',
                  controller: controller.emailTEC,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact Number",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    Row(
                      children: [
                        SizedBox(
                          width: 90.w,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "USA",
                              hintStyle: TextStyle(
                                color: AppColors.primaryBlack.withAlpha(
                                  (255 * .35).round(),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primaryBlack.withAlpha(
                                    (255 * .1).round(),
                                  ),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primaryBlack.withAlpha(
                                    (255 * .1).round(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: TextField(
                            controller: controller.contactNameTEC,
                            decoration: InputDecoration(
                              hintText: "",
                              hintStyle: TextStyle(
                                color: AppColors.primaryBlack.withAlpha(
                                  (255 * .35).round(),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primaryBlack.withAlpha(
                                    (255 * .1).round(),
                                  ),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primaryBlack.withAlpha(
                                    (255 * .1).round(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 16.h),
                _buildInputField(
                  hintText: 'HH/MM/SS',
                  inputText: 'Opening Hour',
                  controller: controller.openingHourTEC,
                  suffixIcon: Icon(Icons.watch_later_outlined),
                ),

                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text("24/7 Open", style: TextStyle(fontSize: 17.sp)),
                    Spacer(),
                    Switch(
                      value: controller.alwaysOpen,
                      onChanged: (value) =>
                          controller.setAlwaysOpenValue(value),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Column _buildInputField({
    required String hintText,
    required String inputText,
    required TextEditingController controller,
    Icon? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputText,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.primaryBlack.withAlpha((255 * .35).round()),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
