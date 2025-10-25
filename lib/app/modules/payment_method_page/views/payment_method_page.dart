import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Payment Method"),
          centerTitle: true,
          backgroundColor: AppColors.primaryWhite,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .1).round(),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cards",
                          style: GoogleFonts.ptSerif(fontSize: 28.sp),
                        ),
                        Text(
                          "You haven’t any card yet. To unlock exclusive deals add your card today.",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.primaryBlack.withAlpha(
                              (255 * .8).round(),
                            ),
                          ),
                        ),

                        SizedBox(height: 24.h),

                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.addCardRoute);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: AppColors.primaryPurple),
                              Text(
                                "Add my card",
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: AppColors.primaryPurple,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
}
