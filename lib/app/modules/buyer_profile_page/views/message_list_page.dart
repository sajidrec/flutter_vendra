import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

class MessageListPage extends StatelessWidget {
  const MessageListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => _buildMessageListElement(),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 10,
        ),
      ),
    );
  }

  InkWell _buildMessageListElement() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.messageRoute);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 48.w,
            height: 48.h,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/u/69637820?v=4",
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Maria Picio", style: TextStyle(fontSize: 17.sp)),
                Text(
                  "I can pay £950.00 for the item you published",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.primaryBlack.withValues(alpha: .8),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Just now",
            style: TextStyle(
              fontSize: 13,
              color: AppColors.primaryBlack.withValues(alpha: .8),
            ),
          ),
        ],
      ),
    );
  }
}
