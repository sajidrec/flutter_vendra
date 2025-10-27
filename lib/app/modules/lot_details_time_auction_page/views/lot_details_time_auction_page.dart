
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/core/data/models/lot_details_model.dart';
import 'package:vendra_app/app/global_widgets/dot_slider_widget.dart';
import 'package:vendra_app/app/modules/lot_details_time_auction_page/controllers/lot_details_time_auction_page_controller.dart';

class LotDetailsTimeAuctionPage extends StatelessWidget {
  const LotDetailsTimeAuctionPage({super.key, required this.lotDetailsModel});

  final LotDetailsModel lotDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryWhite),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<LotDetailsTimeAuctionPageController>(
            builder: (controller) {
              return Column(
                children: [
                  CarouselSlider(
                    items: lotDetailsModel.lotImages!
                        .map(
                          (imgUrl) => SizedBox(
                            width: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: imgUrl,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: AppColors.primaryDanger,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, reason) =>
                          controller.setSliderIndex(index),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.sp),
                          child: Row(
                            children: [
                              DotSliderWidget(
                                dotLength:
                                    lotDetailsModel.lotImages?.length ?? 0,
                                activeDot: controller.sliderIndex,
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_outlined,
                                  color: AppColors.primaryPurple,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share,
                                  color: AppColors.primaryPurple,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(
                          lotDetailsModel.title ?? "",
                          style: TextStyle(fontSize: 28.sp),
                        ),
                        Text(
                          lotDetailsModel.subtitle ?? "",
                          style: TextStyle(fontSize: 17.sp),
                        ),

                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.timerIcon),
                            Text(
                              "${lotDetailsModel.timeLeft} sec left",
                              style: TextStyle(color: AppColors.primaryDanger),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
