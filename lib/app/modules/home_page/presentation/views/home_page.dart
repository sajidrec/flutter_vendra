import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/home_page/presentation/controllers/home_page_controller.dart';
import 'package:vendra_app/app/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Get.dialog(
        Center(
          child: Material(
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Container(
                // width: MediaQuery.of(context).size.width - 20.w,
                // height: 428.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryWhite,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Your auction journey starts here",
                              style: TextStyle(
                                fontSize: 28.sp,
                                color: AppColors.primaryBlack,
                              ), // use Material text style
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.close,

                              color: AppColors.primaryBlack.withAlpha(
                                (255 * .6).round(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 103.h,
                        child: SvgPicture.asset(AppAssets.popUpMsgSegmentOne),
                      ),
                      // SizedBox(height: 8.h),
                      SizedBox(
                        width: double.infinity,
                        height: 123.h,
                        child: SvgPicture.asset(AppAssets.popUpMsgSegmentTwo),
                      ),
                      SizedBox(height: 18.h),
                      Row(
                        children: [
                          Expanded(child: _buildLoginButton()),
                          SizedBox(width: 12.w),
                          Expanded(child: _buildRegisterButton()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: true,
      ),
    );
  }

  InkWell _buildRegisterButton() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.registrationRoute);
      },
      child: SvgPicture.asset(
        AppAssets.registerFilledButton,
        // height: 48.h,
        // width: 168.w,
      ),
    );
  }

  InkWell _buildLoginButton() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.loginRoute);
      },
      child: SvgPicture.asset(
        AppAssets.loginOutlineButton,
        // height: 48.h,
        // width: 168.w,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<HomePageController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchInput(controller),
                  _buildCarouselSection(controller),
                  SizedBox(height: 55.h),
                  _buildCategorySection(),
                  SizedBox(height: 35.h),
                  _buildWeeklyTopPicks(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "Featured Auction",
                      style: TextStyle(
                        fontSize: 28.sp,
                        color: AppColors.primaryBlack,
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // number of columns
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.70, // width/height ratio of each item
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primaryBorderColor,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 12.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: SvgPicture.asset(
                                      AppAssets.heartOutlineIcon,
                                      width: 20.w,
                                      height: 20.h,
                                    ),
                                  ),
                                  CachedNetworkImage(
                                    width: double.infinity,
                                    height: 142.h,
                                    fit: BoxFit.contain,
                                    imageUrl:
                                        "https://static.vecteezy.com/system/resources/thumbnails/012/981/082/small_2x/wireless-headphones-side-view-white-icon-on-a-transparent-background-3d-rendering-png.png",
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "Apple",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Noise-Canceling Wireless Headphone",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "Starting at £130",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  SvgPicture.asset(AppAssets.timerIcon),
                                  Text(
                                    "00d:05h:22 sec left",
                                    style: TextStyle(fontSize: 13.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Padding _buildWeeklyTopPicks() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: Text("Weekly Top Picks", style: TextStyle(fontSize: 28.sp)),
          ),
          SizedBox(
            height: 168.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Column(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: CachedNetworkImage(
                          width: 133.w,
                          height: 133.h,
                          imageUrl:
                              "https://t4.ftcdn.net/jpg/15/05/51/47/360_F_1505514711_kJFZM5lwKSPszilnm7ooNMfe0tYqyfXB.jpg",
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      Text("BAGS", style: TextStyle(fontSize: 13.sp)),
                    ],
                  ),
                ],
              ),
              separatorBuilder: (context, index) => SizedBox(width: 8.w),
              itemCount: 12,
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildCategorySection() {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 24.h),
      child: SizedBox(
        height: 170.h,
        child: ListView.separated(
          shrinkWrap: true,
          primary: false,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 133.w,
                  height: 133.h,
                  imageUrl:
                      "https://images.pexels.com/photos/5011647/pexels-photo-5011647.jpeg?cs=srgb&dl=pexels-rostislav-5011647.jpg&fm=jpg",
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(height: 14.h),
              Text("ENDING SOON", style: TextStyle(fontSize: 13.sp)),
            ],
          ),
          separatorBuilder: (context, index) => SizedBox(width: 12.w),
          itemCount: 5,
        ),
      ),
    );
  }

  Stack _buildCarouselSection(HomePageController controller) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CarouselSlider(
          items: [
            SizedBox(
              height: 424.h,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl:
                    "https://img.freepik.com/premium-photo/online-fashion-shopping-with-computer_23-2150400628.jpg",
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 424.h,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl:
                    "https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg",
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            height: 424.h,
            onPageChanged: (index, reason) {
              controller.changeSliderIndex(activeIndex: index);
            },
            autoPlay: true,
          ),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: -55.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                    blurRadius: 8.r,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    Text(
                      "Women classic festival",
                      style: TextStyle(fontSize: 22.sp),
                    ),
                    SizedBox(height: 16.h),
                    Text("EXPLORE THE LOTS", style: TextStyle(fontSize: 13.sp)),
                    SizedBox(height: 16.h),
                    _buildDotSlider(
                      activeDot: controller.sliderIndex,
                      dotLength: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row _buildDotSlider({required int dotLength, required int activeDot}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotLength,
        (index) => Row(
          children: [
            index == activeDot
                ? Container(
                    width: 6.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlack,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  )
                : Container(
                    width: 6.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryBlack),
                      color: AppColors.primaryWhite,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
            if (index != dotLength - 1) SizedBox(width: 6.w),
          ],
        ),
      ),
    );
  }

  Padding _buildSearchInput(HomePageController controller) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.w,
        right: 16.w,
        bottom: 24.h,
      ),
      child: TextField(
        controller: controller.searchTEC,
        decoration: InputDecoration(
          hintText: "Search for lots, arts, shops...",
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
          fillColor: AppColors.primaryBlack.withAlpha((255 * 0.06).round()),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
