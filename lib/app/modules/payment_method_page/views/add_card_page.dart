import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/payment_method_page/controllers/add_card_page_controller.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Add Card",
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryBlack,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: GetBuilder<AddCardPageController>(
              builder: (controller) {
                InputBorder border = OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                  ),
                );
            
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Card Information",
                      style: GoogleFonts.ptSerif(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20.h),
            
                    // Card Number
                    _buildLabel("Card Number"),
                    SizedBox(height: 6.h),
                    TextField(
                      maxLength: 19,
            
                      controller: controller.cardNumberTec,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "",
                        suffix: SvgPicture.asset(AppAssets.cardsLogoImg),
                        hintText: "XXXX XXXX XXXX XXXX",
                        border: border,
                        focusedBorder: border,
                        enabledBorder: border,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 14.h,
                        ),
                      ),
                    ),
            
                    SizedBox(height: 16.h),
            
                    // Name on Card
                    _buildLabel("Name on Card"),
                    SizedBox(height: 6.h),
                    TextField(
                      controller: controller.cardHolderNameTec,
                      decoration: InputDecoration(
                        hintText: "John Doe",
                        border: border,
                        focusedBorder: border,
                        enabledBorder: border,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 14.h,
                        ),
                      ),
                    ),
            
                    SizedBox(height: 16.h),
            
                    // Expiry Date and CVC Row
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel("Expiry Date"),
                              SizedBox(height: 6.h),
                              TextField(
                                controller: controller.expireDateTec,
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  hintText: "MM/YY",
                                  border: border,
                                  focusedBorder: border,
                                  enabledBorder: border,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 14.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel("CVC Code"),
                              SizedBox(height: 6.h),
                              TextField(
                                controller: controller.cvcTec,
                                keyboardType: TextInputType.number,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "123",
                                  border: border,
                                  focusedBorder: border,
                                  enabledBorder: border,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.w,
                                    vertical: 14.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            
                    SizedBox(height: 16.h),
            
                    Text(
                      "Billing address",
                      style: GoogleFonts.ptSerif(fontSize: 28.sp),
                    ),
                    SizedBox(height: 12.h),
            
                    _buildLabel("Address"),
                    TextField(
                      controller: controller.addressTec,
                      decoration: InputDecoration(
                        hintText: "New York, USA",
                        border: border,
                        focusedBorder: border,
                        enabledBorder: border,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 14.h,
                        ),
                      ),
                    ),
            
                    _buildLabel("Zip Code"),
                    TextField(
                      controller: controller.addressTec,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "1205",
                        border: border,
                        focusedBorder: border,
                        enabledBorder: border,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 14.h,
                        ),
                      ),
                    ),
            
                    Row(
                      children: [
                        Text(
                          "Save this card for future Gavellia payments",
                          style: TextStyle(fontSize: 13.sp),
                        ),
            
                        Spacer(),
            
                        Switch(
                          value: controller.saveCardInfoForLater,
                          inactiveThumbColor: AppColors.primaryWhite,
                          inactiveTrackColor: AppColors.primaryBlack.withAlpha(
                            (255 * .1).round(),
                          ),
            
                          onChanged: (value) {
                            controller.toggleSaveCardInfoForLater();
                          },
                        ),
                      ],
                    ),
            
                    SizedBox(height: 30.h),
                    // Submit button (optional)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlack,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Save my card",
                          style: TextStyle(
                            color: AppColors.primaryWhite,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.grey[700],
      ),
    );
  }
}
