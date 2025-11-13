import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/message_page/controllers/message_page_controller.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Apple",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),

      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMessageFromBuyer(),
                        SizedBox(height: 16.h),
                        _buildMessageFromSeller(),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(12.sp, 0, 12.sp, 12.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GetBuilder<MessagePageController>(
                      builder: (controller) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: TextField(
                            controller: controller.msgTEC,
                            decoration: InputDecoration(
                              hintText: "Write a reply",
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primaryGray,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primaryGray,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Row(
                      children: [
                        const Text("Aa"),
                        SizedBox(width: 12.w),
                        SizedBox(
                          height: 25.h,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.primaryBlack,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text(
                              "GIF",
                              style: TextStyle(fontSize: 10.sp),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.image),
                        ),
                        const Spacer(),
                        InkWell(onTap: () {}, child: const Text("Send")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildMessageFromSeller() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryGray.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(6.r),
            ),

            child: Padding(
              padding: EdgeInsets.all(14.sp),
              child: Text(
                "Thanks for reaching out to Gavellia Support.Please select an option below so we can assist you quickly.",
                style: TextStyle(color: AppColors.primaryBlack),
              ),
            ),
          ),
        ),
        SizedBox(width: 30.w),
      ],
    );
  }

  Row _buildMessageFromBuyer() {
    return Row(
      children: [
        Spacer(),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryPurple,
            borderRadius: BorderRadius.circular(6.r),
          ),

          child: Padding(
            padding: EdgeInsets.all(14.sp),
            child: Text(
              "I’m a buyer 👥",
              style: TextStyle(color: AppColors.primaryWhite),
            ),
          ),
        ),
      ],
    );
  }
}
