class CenterDetailsModel {
  bool? status;
  var message;
  Data? data;

  CenterDetailsModel({this.status, this.message, this.data});

  CenterDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  var id;
  Null? avatar;
  var name;
  bool? isBookmarked;
  Description? description;
  List<Services>? services;
  Location? location;
  Reviews? reviews;

  Data(
      {this.id,
        this.avatar,
        this.name,
        this.isBookmarked,
        this.description,
        this.services,
        this.location,
        this.reviews});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    isBookmarked = json['is_bookmarked'];
    description = json['description'] != null
        ? new Description.fromJson(json['description'])
        : null;
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    reviews =
    json['reviews'] != null ? new Reviews.fromJson(json['reviews']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['is_bookmarked'] = this.isBookmarked;
    if (this.description != null) {
      data['description'] = this.description!.toJson();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.toJson();
    }
    return data;
  }
}

class Description {
  var shortDescription;
  var longDescription;

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

class Services {
  var id;
  var name;

  Services({this.id, this.name});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Location {
  var address;
  var latitude;
  var longitude;

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