import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/lot_details_live_auction_page/presentation/controllers/lot_details_live_auction_page_controller.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class CustomExpantionWidget extends StatelessWidget {
  const CustomExpantionWidget({
    super.key,
    required this.title,
    required this.description,
    required this.index,
  });

  final String title;
  final String description;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LotDetailsLiveAuctionPageController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            color: controller.expanedStatusList[index]
                ? AppColors.primaryPurple.withAlpha((255 * .07).round())
                : AppColors.primaryBlack.withAlpha((255 * .10).round()),
            border: Border.all(
              color: controller.expanedStatusList[index]
                  ? AppColors.primaryPurple
                  : Colors.transparent,
            ),
          ),
          child: ExpansionTile(
            trailing: controller.expanedStatusList[index]
                ? SvgPicture.asset(AppAssets.circularMinusIcon)
                : SvgPicture.asset(AppAssets.circularPlusIcon),
            onExpansionChanged: (value) {
              controller.setExpandedStatusList(index: index, value: value);
            },
            backgroundColor: AppColors.primaryBlack.withAlpha(
              (255 * .10).round(),
            ),
            title: Text(title),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.sp,
                  vertical: 10.sp,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(description),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
