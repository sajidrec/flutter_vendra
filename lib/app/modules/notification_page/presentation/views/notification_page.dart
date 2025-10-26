import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Notifications",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Icon(Icons.notifications, color: AppColors.primaryPurple),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
              children: [
                Icon(Icons.notifications_outlined),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Description this is multiline description of the notification.",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            separatorBuilder: (context, index) => Divider(
              color: AppColors.primaryBlack.withAlpha((255 * 0.25).round()),
            ),
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}
