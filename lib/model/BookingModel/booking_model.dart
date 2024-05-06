class BookingModel {
  bool? status;
  String? message;
  List<Data>? data;
  Pagination? pagination;

  BookingModel({this.status, this.message, this.data, this.pagination});

  BookingModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  Service? service;
  Client? client;
  String? status;
  Summary? summary;

  Data({this.id, this.service, this.client, this.status, this.summary});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
    status = json['status'];
    summary =
    json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    data['status'] = this.status;
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class Service {
  String? id;
  String? avatar;
  String? name;
  String? price;
  Currency? currency;

  Service({this.id, this.avatar, this.name, this.price, this.currency});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    price = json['price'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['price'] = this.price;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    return data;
  }
}

class Currency {
  String? currency;
  String? symbol;

  Currency({this.currency, this.symbol});

  Currency.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['symbol'] = this.symbol;
    return data;
  }
}

class Client {
  String? id;
  Null? avatar;
  String? name;
  String? phone;

  Client({this.id, this.avatar, this.name, this.phone});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avatar = json['avatar'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}

class Summary {
  String? subTotal;
  String? discount;
  String? discountType;
  Null? promotion;
  Currency? currency;
  String? total;

  Summary(
      {this.subTotal,
        this.discount,
        this.discountType,
        this.promotion,
        this.currency,
        this.total});

  Summary.fromJson(Map<String, dynamic> json) {
    subTotal = json['subTotal'];
    discount = json['discount'];
    discountType = json['discountType'];
    promotion = json['promotion'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subTotal'] = this.subTotal;
    data['discount'] = this.discount;
    data['discountType'] = this.discountType;
    data['promotion'] = this.promotion;
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    data['total'] = this.total;
    return data;
  }
}

class CurrencyData {
  String? clientCurrency;
  String? serviceCurrency;
  String? exchangeRate;

  CurrencyData({this.clientCurrency, this.serviceCurrency, this.exchangeRate});

  CurrencyData.fromJson(Map<String, dynamic> json) {
    clientCurrency = json['clientCurrency'];
    serviceCurrency = json['serviceCurrency'];
    exchangeRate = json['exchangeRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientCurrency'] = this.clientCurrency;
    data['serviceCurrency'] = this.serviceCurrency;
    data['exchangeRate'] = this.exchangeRate;
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