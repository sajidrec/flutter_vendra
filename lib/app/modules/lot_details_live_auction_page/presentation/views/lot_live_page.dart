import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/lot_details_live_auction_page/presentation/controllers/lot_live_page_controller.dart';

class LotLivePage extends StatelessWidget {
  LotLivePage({super.key});

  final LotLivePageController controller = Get.put(LotLivePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryWhite,
        actions: [
          Padding(
            padding: EdgeInsets.all(6.sp),
            child: Row(
              children: [
                Text("Paddle No", style: TextStyle(fontSize: 17.sp)),
                SizedBox(width: 6.w),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryPurple,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6.sp),
                    child: Text(
                      "9",
                      style: TextStyle(color: AppColors.primaryWhite),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        title: Text(
          "Live Auction",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<LotLivePageController>(
            builder: (controller) {
              return Column(children: []);
            },
          ),
        ),
      ),
    );
  }
}
