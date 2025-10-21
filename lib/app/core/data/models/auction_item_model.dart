// {
// "itemName": "",
// "imgUrl": "",
// "description": "",
// "id": "",
// "highestBid": 0,
// "isFavourite": false,
// "timeLeft": "2025-10-21T18:00:00Z",
// "topBidders": [
// {
// "name": "Pristine Auction",
// "profilePic": "",
// "price": 0
// },
// {
// "name": "Pristine Auction",
// "profilePic": "",
// "price": 0
// },
// {
// "name": "Pristine Auction",
// "profilePic": "",
// "price": 0
// }
// ]
// }

class AuctionItemModel {
  String? itemName;
  String? imgUrl;
  String? description;
  String? id;
  int? highestBid;
  bool? isFavourite;
  String? timeLeft;
  List<TopBidders>? topBidders;

  AuctionItemModel({
    this.itemName,
    this.imgUrl,
    this.description,
    required this.id,
    this.highestBid,
    this.isFavourite,
    this.timeLeft,
    this.topBidders,
  });

  AuctionItemModel.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    imgUrl = json['imgUrl'];
    description = json['description'];
    id = json['id'];
    highestBid = json['highestBid'];
    isFavourite = json['isFavourite'];
    timeLeft = json['timeLeft'];
    if (json['topBidders'] != null) {
      topBidders = <TopBidders>[];
      json['topBidders'].forEach((v) {
        topBidders!.add(TopBidders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemName'] = itemName;
    data['imgUrl'] = imgUrl;
    data['description'] = description;
    data['id'] = id;
    data['highestBid'] = highestBid;
    data['isFavourite'] = isFavourite;
    data['timeLeft'] = timeLeft;
    if (topBidders != null) {
      data['topBidders'] = topBidders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopBidders {
  String? name;
  String? profilePic;
  double? price;

  TopBidders({this.name, this.profilePic, this.price});

  TopBidders.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePic = json['profilePic'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profilePic'] = profilePic;
    data['price'] = price;
    return data;
  }
}
