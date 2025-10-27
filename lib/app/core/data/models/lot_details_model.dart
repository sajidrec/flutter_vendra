/// lotImages : ["https://example.com/lot_img1.jpg","https://example.com/lot_img2.jpg","https://example.com/lot_img3.jpg"]
/// thumbnail : "https://example.com/lot_img1.jpg"
/// isFavourite : true
/// title : "Vintage Rolex Watch"
/// subtitle : "1960s Oyster Perpetual Model"
/// timeLeft : "2h 15m"
/// condition : "Excellent"
/// color : "Silver"
/// size : "42mm"
/// description : "A well-preserved vintage Rolex Oyster Perpetual with original certificate and box."
/// specialFeature : "Automatic movement, Original leather strap"
/// deliveryAvailableIn : ["Worldwide","Europe","USA"]
/// sellerProfile : {"name":"Classic Timepieces","id":"seller_001","followerList":["user_101","user_102","user_103"],"messageList":["msg_001","msg_002","msg_003"]}
/// isLive : false
/// startingPrice : 1500.00
/// totalBids : 12
/// highestBid : 2780.50
/// joinLiveAuction : "https://auctionsite.com/live/lot/001"
library;

class LotDetailsModel {
  LotDetailsModel({
    List<String>? lotImages,
    String? thumbnail,
    bool? isFavourite,
    String? title,
    String? subtitle,
    String? timeLeft,
    String? condition,
    String? color,
    String? size,
    String? description,
    String? specialFeature,
    List<String>? deliveryAvailableIn,
    SellerProfile? sellerProfile,
    bool? isLive,
    num? startingPrice,
    num? totalBids,
    num? highestBid,
    String? joinLiveAuction,
  }) {
    _lotImages = lotImages;
    _thumbnail = thumbnail;
    _isFavourite = isFavourite;
    _title = title;
    _subtitle = subtitle;
    _timeLeft = timeLeft;
    _condition = condition;
    _color = color;
    _size = size;
    _description = description;
    _specialFeature = specialFeature;
    _deliveryAvailableIn = deliveryAvailableIn;
    _sellerProfile = sellerProfile;
    _isLive = isLive;
    _startingPrice = startingPrice;
    _totalBids = totalBids;
    _highestBid = highestBid;
    _joinLiveAuction = joinLiveAuction;
  }

  LotDetailsModel.fromJson(dynamic json) {
    _lotImages = json['lotImages'] != null
        ? json['lotImages'].cast<String>()
        : [];
    _thumbnail = json['thumbnail'];
    _isFavourite = json['isFavourite'];
    _title = json['title'];
    _subtitle = json['subtitle'];
    _timeLeft = json['timeLeft'];
    _condition = json['condition'];
    _color = json['color'];
    _size = json['size'];
    _description = json['description'];
    _specialFeature = json['specialFeature'];
    _deliveryAvailableIn = json['deliveryAvailableIn'] != null
        ? json['deliveryAvailableIn'].cast<String>()
        : [];
    _sellerProfile = json['sellerProfile'] != null
        ? SellerProfile.fromJson(json['sellerProfile'])
        : null;
    _isLive = json['isLive'];
    _startingPrice = json['startingPrice'];
    _totalBids = json['totalBids'];
    _highestBid = json['highestBid'];
    _joinLiveAuction = json['joinLiveAuction'];
  }

  List<String>? _lotImages;
  String? _thumbnail;
  bool? _isFavourite;
  String? _title;
  String? _subtitle;
  String? _timeLeft;
  String? _condition;
  String? _color;
  String? _size;
  String? _description;
  String? _specialFeature;
  List<String>? _deliveryAvailableIn;
  SellerProfile? _sellerProfile;
  bool? _isLive;
  num? _startingPrice;
  num? _totalBids;
  num? _highestBid;
  String? _joinLiveAuction;

  LotDetailsModel copyWith({
    List<String>? lotImages,
    String? thumbnail,
    bool? isFavourite,
    String? title,
    String? subtitle,
    String? timeLeft,
    String? condition,
    String? color,
    String? size,
    String? description,
    String? specialFeature,
    List<String>? deliveryAvailableIn,
    SellerProfile? sellerProfile,
    bool? isLive,
    num? startingPrice,
    num? totalBids,
    num? highestBid,
    String? joinLiveAuction,
  }) => LotDetailsModel(
    lotImages: lotImages ?? _lotImages,
    thumbnail: thumbnail ?? _thumbnail,
    isFavourite: isFavourite ?? _isFavourite,
    title: title ?? _title,
    subtitle: subtitle ?? _subtitle,
    timeLeft: timeLeft ?? _timeLeft,
    condition: condition ?? _condition,
    color: color ?? _color,
    size: size ?? _size,
    description: description ?? _description,
    specialFeature: specialFeature ?? _specialFeature,
    deliveryAvailableIn: deliveryAvailableIn ?? _deliveryAvailableIn,
    sellerProfile: sellerProfile ?? _sellerProfile,
    isLive: isLive ?? _isLive,
    startingPrice: startingPrice ?? _startingPrice,
    totalBids: totalBids ?? _totalBids,
    highestBid: highestBid ?? _highestBid,
    joinLiveAuction: joinLiveAuction ?? _joinLiveAuction,
  );

  List<String>? get lotImages => _lotImages;

  String? get thumbnail => _thumbnail;

  bool? get isFavourite => _isFavourite;

  String? get title => _title;

  String? get subtitle => _subtitle;

  String? get timeLeft => _timeLeft;

  String? get condition => _condition;

  String? get color => _color;

  String? get size => _size;

  String? get description => _description;

  String? get specialFeature => _specialFeature;

  List<String>? get deliveryAvailableIn => _deliveryAvailableIn;

  SellerProfile? get sellerProfile => _sellerProfile;

  bool? get isLive => _isLive;

  num? get startingPrice => _startingPrice;

  num? get totalBids => _totalBids;

  num? get highestBid => _highestBid;

  String? get joinLiveAuction => _joinLiveAuction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lotImages'] = _lotImages;
    map['thumbnail'] = _thumbnail;
    map['isFavourite'] = _isFavourite;
    map['title'] = _title;
    map['subtitle'] = _subtitle;
    map['timeLeft'] = _timeLeft;
    map['condition'] = _condition;
    map['color'] = _color;
    map['size'] = _size;
    map['description'] = _description;
    map['specialFeature'] = _specialFeature;
    map['deliveryAvailableIn'] = _deliveryAvailableIn;
    if (_sellerProfile != null) {
      map['sellerProfile'] = _sellerProfile?.toJson();
    }
    map['isLive'] = _isLive;
    map['startingPrice'] = _startingPrice;
    map['totalBids'] = _totalBids;
    map['highestBid'] = _highestBid;
    map['joinLiveAuction'] = _joinLiveAuction;
    return map;
  }
}

/// name : "Classic Timepieces"
/// id : "seller_001"
/// followerList : ["user_101","user_102","user_103"]
/// messageList : ["msg_001","msg_002","msg_003"]

class SellerProfile {
  SellerProfile({
    String? name,
    String? id,
    List<String>? followerList,
    List<String>? messageList,
  }) {
    _name = name;
    _id = id;
    _followerList = followerList;
    _messageList = messageList;
  }

  SellerProfile.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _followerList = json['followerList'] != null
        ? json['followerList'].cast<String>()
        : [];
    _messageList = json['messageList'] != null
        ? json['messageList'].cast<String>()
        : [];
  }

  String? _name;
  String? _id;
  List<String>? _followerList;
  List<String>? _messageList;

  SellerProfile copyWith({
    String? name,
    String? id,
    List<String>? followerList,
    List<String>? messageList,
  }) => SellerProfile(
    name: name ?? _name,
    id: id ?? _id,
    followerList: followerList ?? _followerList,
    messageList: messageList ?? _messageList,
  );

  String? get name => _name;

  String? get id => _id;

  List<String>? get followerList => _followerList;

  List<String>? get messageList => _messageList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['followerList'] = _followerList;
    map['messageList'] = _messageList;
    return map;
  }
}
