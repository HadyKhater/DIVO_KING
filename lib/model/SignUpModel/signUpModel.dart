class SignUpModel {
  bool? status;
  String? message;
  Data? data;

  SignUpModel({this.status, this.message, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  Null? avatar;
  String? name;
  String? email;
  String? phone;
  Null? phoneVerified;
  int? reviews;
  int? bookmarked;
  int? trips;
  int? bookings;
  int? orders;

  User(
      {this.id,
        this.avatar,
        this.name,
        this.email,
        this.phone,
        this.phoneVerified,
        this.reviews,
        this.bookmarked,
        this.trips,
        this.bookings,
        this.orders});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    phoneVerified = json['phone_verified'];
    reviews = json['reviews'];
    bookmarked = json['bookmarked'];
    trips = json['trips'];
    bookings = json['bookings'];
    orders = json['orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['phone_verified'] = this.phoneVerified;
    data['reviews'] = this.reviews;
    data['bookmarked'] = this.bookmarked;
    data['trips'] = this.trips;
    data['bookings'] = this.bookings;
    data['orders'] = this.orders;
    return data;
  }
}