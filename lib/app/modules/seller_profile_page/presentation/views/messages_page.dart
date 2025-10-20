import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import 'package:get/get.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 3.2,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                "https://avatars.githubusercontent.com/u/69637820?v=4",
              ),
            ),
            SizedBox(width: 16.w),
            SizedBox(
              width: Get.width / 1.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "MD. Sajid Hossain",
                        style: TextStyle(
                          fontSize: 17.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "20 min ago",
                        style: TextStyle(
                          fontSize: 13.sp,
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.primaryBlack.withAlpha(
                            (255 * .6).round(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "I can pay £950.00 for the item you published",
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 13.sp,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.primaryBlack.withAlpha(
                        (255 * .8).round(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 50,
      ),
    );
  }
}
