import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/edit_profile_page/presentation/controllers/edit_profile_page_controller.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit")),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.5.w),
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlack,
                foregroundColor: AppColors.primaryWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              child: const Text("Save changes"),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderSection(),
                SizedBox(height: 36.h),
                Text(
                  "General Information",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.primaryBlack.withValues(alpha: .8),
                  ),
                ),
                SizedBox(height: 12.h),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: AppColors.primaryBlack.withValues(alpha: .1),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDisplayNameInput(),
                        SizedBox(height: 14.h),
                        _buildUserNameInput(),
                        SizedBox(height: 14.h),
                        _buildEmailInput(),
                        Text(
                          "To change your email upgrade to pro.",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.primaryBlack.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        _buildPasswordInput(),
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

  GetBuilder<EditProfilePageController> _buildDisplayNameInput() {
    return GetBuilder<EditProfilePageController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Display Name", style: TextStyle(fontSize: 13.sp)),
            TextField(
              controller: controller.nameTEC,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 16.h,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryBlack.withValues(alpha: .1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryBlack.withValues(alpha: .1),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  GetBuilder<EditProfilePageController> _buildUserNameInput() {
    return GetBuilder<EditProfilePageController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User Name", style: TextStyle(fontSize: 13.sp)),
            TextField(
              controller: controller.userNameTEC,
              decoration: InputDecoration(
                prefixText: "@",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 16.h,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryBlack.withValues(alpha: .1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryBlack.withValues(alpha: .1),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  GetBuilder<EditProfilePageController> _buildEmailInput() {
    return GetBuilder<EditProfilePageController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email", style: TextStyle(fontSize: 13.sp)),
            TextField(
              controller: controller.emailTEC,
              enabled: false,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.lock_outline),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 16.h,
                ),
                filled: true,
                fillColor: AppColors.primaryBlack.withValues(alpha: .1),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryBlack.withValues(alpha: .1),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryBlack.withValues(alpha: .1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryBlack.withValues(alpha: .1),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  GetBuilder<EditProfilePageController> _buildPasswordInput() {
    return GetBuilder<EditProfilePageController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Password", style: TextStyle(fontSize: 13.sp)),
            TextField(
              controller: controller.passTEC,
              obscureText: controller.obscureText,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.toggleObscureText();
                  },
                  icon: Icon(
                    controller.obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 16.h,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryBlack.withValues(alpha: .1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  borderSide: BorderSide(
                    color: AppColors.primaryBlack.withValues(alpha: .1),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Row _buildHeaderSection() {
    return Row(
      children: [
        SizedBox(
          width: 100.w,
          height: 100.h,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://plus.unsplash.com/premium_photo-1689530775582-83b8abdb5020?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVyc29ufGVufDB8fDB8fHww",
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alex Morgan",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22.sp),
            ),
            Text(
              "@alex_morgan",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13.sp),
            ),
          ],
        ),
      ],
    );
  }
}
