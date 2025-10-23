import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/core/data/models/auction_item_model.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_assets.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final List<AuctionItemModel> auctionItemModelList = [
    AuctionItemModel(
      imgUrl:
          "https://images.pexels.com/photos/1557652/pexels-photo-1557652.jpeg?cs=srgb&dl=pexels-lukas-hartmann-304281-1557652.jpg&fm=jpg",
      id: "ABC",
      topBidders: [
        TopBidders(
          profilePic:
              "https://media.istockphoto.com/id/636379014/photo/hands-forming-a-heart-shape-with-sunset-silhouette.jpg?s=612x612&w=0&k=20&c=CgjWWGEasjgwia2VT7ufXa10azba2HXmUDe96wZG8F0=",
          price: 99,
          name: "profile pic",
        ),
      ],
      timeLeft: "2days",
      itemName: "Test item",
      isFavourite: false,
      highestBid: 999,
      description:
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata",
    ),
    AuctionItemModel(
      imgUrl:
          "https://images.pexels.com/photos/1557652/pexels-photo-1557652.jpeg?cs=srgb&dl=pexels-lukas-hartmann-304281-1557652.jpg&fm=jpg",
      id: "ABC",
      topBidders: [
        TopBidders(
          profilePic:
              "https://media.istockphoto.com/id/636379014/photo/hands-forming-a-heart-shape-with-sunset-silhouette.jpg?s=612x612&w=0&k=20&c=CgjWWGEasjgwia2VT7ufXa10azba2HXmUDe96wZG8F0=",
          price: 99,
          name: "profile pic",
        ),
      ],
      timeLeft: "2days",
      itemName: "Test item",
      isFavourite: false,
      highestBid: 999,
      description: "nothing to say",
    ),
    AuctionItemModel(
      imgUrl:
          "https://images.pexels.com/photos/1557652/pexels-photo-1557652.jpeg?cs=srgb&dl=pexels-lukas-hartmann-304281-1557652.jpg&fm=jpg",
      id: "ABC",
      topBidders: [
        TopBidders(
          profilePic:
              "https://media.istockphoto.com/id/636379014/photo/hands-forming-a-heart-shape-with-sunset-silhouette.jpg?s=612x612&w=0&k=20&c=CgjWWGEasjgwia2VT7ufXa10azba2HXmUDe96wZG8F0=",
          price: 99,
          name: "profile pic",
        ),
      ],
      timeLeft: "2days",
      itemName: "Test item",
      isFavourite: false,
      highestBid: 999,
      description: "nothing to say",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Favorite"),
          centerTitle: true,
          backgroundColor: AppColors.primaryWhite,
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.sp, vertical: 6.sp),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(
                  color: AppColors.primaryBlack.withAlpha((255 * .1).round()),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6.r),
                          child: CachedNetworkImage(
                            width: double.infinity,
                            height: Get.width / 1.5,
                            fit: BoxFit.cover,
                            imageUrl: auctionItemModelList[index].imgUrl ?? "",
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Text(
                          auctionItemModelList[index].itemName ?? "",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.primaryBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Text(
                          auctionItemModelList[index].description ?? "",
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "Highest bid £${auctionItemModelList[index].highestBid.toString()}",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.timerIcon, width: 15.sp),
                            SizedBox(width: 6.w),
                            Text(
                              "${auctionItemModelList[index].timeLeft} left",
                            ),
                          ],
                        ),
                      ],
                    ),

                    Positioned(
                      top: 5,
                      right: 5,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: AppColors.primaryDanger,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 0.h),
          itemCount: auctionItemModelList.length,
        ),
      ),
    );
  }
}
