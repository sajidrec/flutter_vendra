import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Seller Information",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),

        SizedBox(height: 15.h),

        Row(
          children: [
            Icon(Icons.home_outlined),
            SizedBox(width: 16.w),
            Text(
              "Steet Name, New York, USA",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            Icon(Icons.markunread_mailbox_outlined),
            SizedBox(width: 16.w),
            Text(
              "example@gmail.com",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            Icon(Icons.phone_android),
            SizedBox(width: 16.w),
            Text(
              "+1 5464 36548",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            Icon(Icons.history),
            SizedBox(width: 16.w),
            Text(
              "24/7 Open",
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            Icon(Icons.link),
            SizedBox(width: 16.w),
            Text(
              "www.domainname.com",
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryPurple,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
