import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/core/data/models/auction_item_model.dart';

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
      description: "Lorem ipsum dolor sit amet, ",
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Lots"),
        centerTitle: true,
        backgroundColor: AppColors.primaryWhite,
      ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(16.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: auctionItemModelList[index].imgUrl ?? "",
                  width: 204.w,
                  height: 204.h,
                  fit: BoxFit.cover,
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          auctionItemModelList[index].itemName ?? "",
                          style: TextStyle(fontSize: 20.sp),
                        ),
                        Text(
                          auctionItemModelList[index].description ?? "",
                          style: TextStyle(
                            fontSize: 13.sp,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.primaryBlack.withAlpha(
                              (255 * .8).round(),
                            ),
                          ),
                          maxLines: 2,
                        ),
                        SizedBox(height: 6.h),

                        Text("Color: Black"),
                        Text("Size: XL"),
                        Text("Qty: 1"),

                        SizedBox(height: 6.h),

                        Text(
                          "00d:05h:22 sec left",
                          style: TextStyle(color: AppColors.primaryDanger),
                        ),
                        Text("£420.00 Bids", style: TextStyle(fontSize: 15.sp)),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Remove",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 0.h),
          itemCount: auctionItemModelList.length,
        ),
      ),
    );
  }
}
