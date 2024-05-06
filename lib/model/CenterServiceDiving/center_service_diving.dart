class CenterServiceDivingModel {
  bool? status;
  String? message;
  List<Data>? data;
  Pagination? pagination;

  CenterServiceDivingModel(
      {this.status, this.message, this.data, this.pagination});

  CenterServiceDivingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? level;
  bool? isBookmarked;
  String? price;
  Location? location;
  Currency? currency;
  DivingCenter? divingCenter;
  String? discount;
  String? discountType;
  String? category;
  String? fullRefundDays;
  String? halfRefundDays;
  String? noRefundDays;
  Description? description;
  List<String>? images;
  Reviews? reviews;

  Data(
      {this.id,
        this.name,
        this.level,
        this.isBookmarked,
        this.price,
        this.location,
        this.currency,
        this.divingCenter,
        this.discount,
        this.discountType,
        this.category,
        this.fullRefundDays,
        this.halfRefundDays,
        this.noRefundDays,
        this.description,
        this.images,
        this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    level = json['level'];
    isBookmarked = json['is_bookmarked'];
    price = json['price'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    divingCenter = json['divingCenter'] != null
        ? new DivingCenter.fromJson(json['divingCenter'])
        : null;
    discount = json['discount'];
    discountType = json['discountType'];
    category = json['category'];
    fullRefundDays = json['fullRefundDays'];
    halfRefundDays = json['halfRefundDays'];
    noRefundDays = json['noRefundDays'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    images = json['images'].cast<String>();
    reviews =
    json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['level'] = this.level;
    data['is_bookmarked'] = this.isBookmarked;
    data['price'] = this.price;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    if (this.divingCenter != null) {
      data['divingCenter'] = this.divingCenter!.toJson();
    }
    data['discount'] = this.discount;
    data['discountType'] = this.discountType;
    data['category'] = this.category;
    data['fullRefundDays'] = this.fullRefundDays;
    data['halfRefundDays'] = this.halfRefundDays;
    data['noRefundDays'] = this.noRefundDays;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    data['images'] = this.images;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.toJson();
    }
    return data;
  }
}

class Location {
  String? address;
  Null? latitude;
  Null? longitude;

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
  List<String>? avatar;

  DivingCenter({this.id, this.name, this.avatar});

  DivingCenter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Description {
  String? shortDescription;
  String? longDescription;

  Description({this.shortDescription, this.longDescription});

  Description.fromJson(Map<String, dynamic> json) {
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    return data;
  }
}

class Reviews {
  int? rate;
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

class Pagination {
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Pagination(
      {this.total,
        this.count,
        this.perPage,
        this.currentPage,
        this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    count = json['count'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['count'] = this.count;
    data['perPage'] = this.perPage;
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    return data;
  }
}