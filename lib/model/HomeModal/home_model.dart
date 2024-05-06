class HomeModel {
  bool? status;
  String? message;
  List<Data>? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? level;
  int? price;
  bool? isBookmarked;
  Currency? currency;
  DivingCenter? divingCenter;
  Reviews? reviews;
  List<String>? images;

  Data(
      {this.id,
      this.name,
      this.level,
      this.price,
      this.isBookmarked,
      this.currency,
      this.divingCenter,
      this.reviews,
      this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    level = json['level'];
    price = json['price'];
    isBookmarked = json['is_bookmarked'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    divingCenter = json['divingCenter'] != null
        ? new DivingCenter.fromJson(json['divingCenter'])
        : null;
    reviews =
        json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['level'] = this.level;
    data['price'] = this.price;
    data['is_bookmarked'] = this.isBookmarked;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    if (this.divingCenter != null) {
      data['divingCenter'] = this.divingCenter!.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.toJson();
    }
    data['images'] = this.images;
    return data;
  }
}

class Currency {
  String? name;
  String? symbol;

  Currency({this.name, this.symbol});

  Currency.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    return data;
  }
}

class DivingCenter {
  int? id;
  String? name;
  Location? location;

  DivingCenter({this.id, this.name, this.location});

  DivingCenter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    return data;
  }
}

class Location {
  String? address;
  int? latitude;
  int? longitude;

  Location({this.address, this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Reviews {
  String? rate;
  int? totalReviews;

  Reviews({this.rate, this.totalReviews});

  Reviews.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    totalReviews = json['totalReviews'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rate'] = this.rate;
    data['totalReviews'] = this.totalReviews;
    return data;
  }
}