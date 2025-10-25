/// cardNumber : "4111111111111111"
/// cardHolderName : "sajidrec"
/// expireDate : "12/28"
/// cvcCode : "123"
/// address : "123 Main Street, Springfield"
/// zipCode : "98765"
library;

class CardModel {
  CardModel({
    String? cardNumber,
    String? cardHolderName,
    String? expireDate,
    String? cvcCode,
    String? address,
    String? zipCode,
  }) {
    _cardNumber = cardNumber;
    _cardHolderName = cardHolderName;
    _expireDate = expireDate;
    _cvcCode = cvcCode;
    _address = address;
    _zipCode = zipCode;
  }

  CardModel.fromJson(dynamic json) {
    _cardNumber = json['cardNumber'];
    _cardHolderName = json['cardHolderName'];
    _expireDate = json['expireDate'];
    _cvcCode = json['cvcCode'];
    _address = json['address'];
    _zipCode = json['zipCode'];
  }

  String? _cardNumber;
  String? _cardHolderName;
  String? _expireDate;
  String? _cvcCode;
  String? _address;
  String? _zipCode;

  CardModel copyWith({
    String? cardNumber,
    String? cardHolderName,
    String? expireDate,
    String? cvcCode,
    String? address,
    String? zipCode,
  }) => CardModel(
    cardNumber: cardNumber ?? _cardNumber,
    cardHolderName: cardHolderName ?? _cardHolderName,
    expireDate: expireDate ?? _expireDate,
    cvcCode: cvcCode ?? _cvcCode,
    address: address ?? _address,
    zipCode: zipCode ?? _zipCode,
  );

  String? get cardNumber => _cardNumber;

  String? get cardHolderName => _cardHolderName;

  String? get expireDate => _expireDate;

  String? get cvcCode => _cvcCode;

  String? get address => _address;

  String? get zipCode => _zipCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cardNumber'] = _cardNumber;
    map['cardHolderName'] = _cardHolderName;
    map['expireDate'] = _expireDate;
    map['cvcCode'] = _cvcCode;
    map['address'] = _address;
    map['zipCode'] = _zipCode;
    return map;
  }
}
