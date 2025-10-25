import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import '../controllers/choose_currency_controller.dart';

class ChooseCurrencyBottomSheet extends StatelessWidget {
  const ChooseCurrencyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseCurrencyController>(
      init: ChooseCurrencyController(),
      builder: (controller) {
        return Container(
          height: Get.height / 2,
          decoration: BoxDecoration(
            color: AppColors.primaryWhite,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar (Drag handle or title)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Choose currency",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: const Icon(Icons.close, size: 20),
                    ),
                  ],
                ),
              ),

              Divider(height: 1),

              // Search field
              Padding(
                padding: EdgeInsets.all(12.sp),
                child: TextField(
                  onChanged: controller.onSearch,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.grey[600],
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14.sp,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // Currency list
              Expanded(
                child: ListView.separated(
                  itemCount: controller.filteredCurrencies.length,
                  separatorBuilder: (_, __) => Divider(height: 1),
                  itemBuilder: (context, index) {
                    final currency = controller.filteredCurrencies[index];
                    final isSelected = controller.selectedCurrency == currency;
                    return ListTile(
                      title: Text(currency, style: TextStyle(fontSize: 15.sp)),
                      trailing: isSelected
                          ? Icon(
                              Icons.check,
                              color: AppColors.primaryBlack,
                              size: 18,
                            )
                          : null,
                      onTap: () => controller.selectCurrency(currency),
                    );
                  },
                ),
              ),

              // Done button
              Padding(
                padding: EdgeInsets.all(16.sp),
                child: SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlack,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () =>
                        Get.back(result: controller.selectedCurrency),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        color: AppColors.primaryWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
