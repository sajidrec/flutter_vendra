import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/controllers/support_page_controller.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: GetBuilder<SupportPageController>(
            init: SupportPageController(),
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                  ),
                  TextField(
                    onSubmitted: (value) {
                      log("message from me value : ${controller.msgTEC.text}");
                      controller.msgTEC.text = "";
                    },
                    controller: controller.msgTEC,
                    decoration: InputDecoration(
                      hintText: "Write a replay",
                      hintStyle: TextStyle(
                        fontSize: 17.sp,
                        color: AppColors.primaryBlack.withAlpha(
                          (255 * .4).round(),
                        ),
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.image)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.send)),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primaryWhite,
          title: Text(
            "Support centre",
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
          ),
        ),
        body: GetBuilder<SupportPageController>(
          init: SupportPageController(),
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildMessageFromMe(msg: "From me"),
                    _buildMessageFromOther(msg: "From others"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Padding _buildMessageFromOther({required String msg}) {
    return Padding(
      padding: EdgeInsets.all(3.sp),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
              ),

              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Text(
                  msg,
                  style: TextStyle(
                    color: AppColors.primaryBlack,
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildMessageFromMe({required String msg}) {
    return Padding(
      padding: EdgeInsets.all(3.sp),
      child: Align(
        alignment: Alignment.centerRight,
        child: Wrap(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.primaryPurple,
              ),

              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Text(
                  msg,
                  style: TextStyle(
                    color: AppColors.primaryWhite,
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
