import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';

import '../../../../core/constants/app_assets.dart';
import '../controllers/bottom_navbar_page_controller.dart';

class BottomNavbarPage extends StatelessWidget {
  const BottomNavbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: GetBuilder<BottomNavbarPageController>(
          builder: (controller) {
            return BottomNavigationBar(
              backgroundColor: AppColors.primaryWhite,
              selectedItemColor: AppColors.primaryBlack,
              unselectedItemColor: AppColors.primaryBlack,
              type: BottomNavigationBarType.fixed,
              items: _buildBottomNavbarItemList(controller),
              currentIndex: controller.index,
              onTap: (int index) {
                controller.changePage(index);
              },
            );
          },
        ),
        body: GetBuilder<BottomNavbarPageController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: controller.pages[controller.index],
            );
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavbarItemList(
    BottomNavbarPageController controller,
  ) {
    return [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          controller.index == 0
              ? AppAssets.homeFillIcon
              : AppAssets.homeOutlineIcon,
          width: 24.w,
          height: 24.h,
        ),
        label: "Explore",
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          controller.index == 1
              ? AppAssets.favouriteFillIcon
              : AppAssets.favouriteOutlineIcon,
          width: 24.w,
          height: 24.h,
        ),
        label: "Favorite",
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppAssets.plusCircleIcon,
          width: 24.w,
          height: 24.h,
        ),
        label: "Sell",
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppAssets.notificationOutlineIcon,
          width: 24.w,
          height: 24.h,
        ),
        label: "Notifications",
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppAssets.personOutlineIcon,
          width: 24.w,
          height: 24.h,
        ),
        label: "Me",
      ),
    ];
  }
}
