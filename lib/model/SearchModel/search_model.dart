class SearchModel {
  bool? status;
  var message;
  List<Data>? data;

  SearchModel({this.status, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
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
  var id;
  var type;
  var name;
  List<dynamic>? avatar;
  var address;
  Reviews? reviews;
  var price;
  var category;
  Currency? currency;

  Data(
      {this.id,
        this.type,
        this.name,
        this.avatar,
        this.address,
        this.reviews,
        this.price,
        this.category,
        this.currency});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    avatar = json['avatar'];
    address = json['address'];
    reviews =
    json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
    price = json['price'];
    category = json['category'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['address'] = this.address;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.toJson();
    }
    data['price'] = this.price;
    data['category'] = this.category;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    return data;
  }
}

class Reviews {
  var rate;
  var totalReviews;

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

class Currency {
  var name;
  var symbol;

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