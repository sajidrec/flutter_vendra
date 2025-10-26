import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/controllers/tag_page_controller.dart';

class TagsPage extends StatelessWidget {
  const TagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tag#",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
        ),
        backgroundColor: AppColors.primaryWhite,
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 16.sp),
              child: Row(
                children: [
                  Text(
                    "Save ",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.primaryPurple,
                    ),
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    color: AppColors.primaryPurple,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 10.sp),
            child: GetBuilder<TagPageController>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      runSpacing: 8.h,
                      spacing: 8.w,
                      children: controller.selectedTags
                          .map((e) => _buildSelectedTagChip(name: e.toString()))
                          .toList(),
                    ),

                    SizedBox(height: 16.h),

                    TextField(
                      controller: controller.searchTEC,

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 8.sp,
                          horizontal: 14.sp,
                        ),
                        fillColor: AppColors.primaryBlack.withAlpha(
                          (255 * .06).round(),
                        ),
                        filled: true,
                        hintText: "Search tags",
                        hintStyle: TextStyle(
                          color: AppColors.primaryBlack.withAlpha(
                            (255 * .6).round(),
                          ),
                        ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: AppColors.primaryPurple,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: AppColors.primaryPurple,
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Wrap(
                      runSpacing: 8.h,
                      spacing: 8.w,
                      children: controller.unSelectedTags
                          .map(
                            (e) => _buildUnselectedTagChip(name: e.toString()),
                          )
                          .toList(),
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

  GetBuilder _buildUnselectedTagChip({required String name}) {
    return GetBuilder<TagPageController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.removeFromUnselectedTags(tagName: name);
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryBlack.withAlpha((255 * .06).round()),
              borderRadius: BorderRadius.circular(999.sp),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
              child: Text(name, style: TextStyle(fontSize: 16.sp)),
            ),
          ),
        );
      },
    );
  }

  GetBuilder _buildSelectedTagChip({required String name}) {
    return GetBuilder<TagPageController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999.r),
            color: AppColors.primaryPurple.withAlpha((255 * .08).round()),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 16.sp),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "#$name",
                  style: TextStyle(color: AppColors.primaryPurple),
                ),
                IconButton(
                  onPressed: () {
                    controller.removeFromSelectedTags(tagName: name);
                  },
                  icon: Icon(
                    size: 20.sp,
                    Icons.cancel_outlined,
                    color: AppColors.primaryPurple,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
