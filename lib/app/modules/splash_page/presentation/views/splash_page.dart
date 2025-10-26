import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: SafeArea(
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Gavellia",
                style: GoogleFonts.ptSerif(
                  fontSize: 55.sp,
                  color: AppColors.primaryWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              bottom: 76.h,
              left: 0,
              right: 0,
              child: CupertinoActivityIndicator(
                color: AppColors.primaryWhite,
                radius: 22.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
