// class ReviewModel {
//   bool? status;
//   var message;
//   List<Data>? data;
//   Pagination? pagination;
//
//   ReviewModel({this.status, this.message, this.data, this.pagination});
//
//   ReviewModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     pagination = json['pagination'] != null
//         ? new Pagination.fromJson(json['pagination'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (this.pagination != null) {
//       data['pagination'] = this.pagination!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   var id;
//   var type;
//   Client? client;
//   var rate;
//   var comment;
//
//   Data({this.id, this.type, this.client, this.rate, this.comment});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     type = json['type'];
//     client =
//     json['client'] != null ? new Client.fromJson(json['client']) : null;
//     rate = json['rate'];
//     comment = json['comment'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['type'] = this.type;
//     if (this.client != null) {
//       data['client'] = this.client!.toJson();
//     }
//     data['rate'] = this.rate;
//     data['comment'] = this.comment;
//     return data;
//   }
// }
//
// class Client {
//   var id;
//   var name;
//   var avatar;
//
//   Client({this.id, this.name, this.avatar});
//
//   Client.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     avatar = json['avatar'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['avatar'] = this.avatar;
//     return data;
//   }
// }
//
// class Pagination {
//   var total;
//   var count;
//   var perPage;
//   var currentPage;
//   var totalPages;
//
//   Pagination(
//       {this.total,
//         this.count,
//         this.perPage,
//         this.currentPage,
//         this.totalPages});
//
//   Pagination.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     count = json['count'];
//     perPage = json['perPage'];
//     currentPage = json['currentPage'];
//     totalPages = json['totalPages'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     data['count'] = this.count;
//     data['perPage'] = this.perPage;
//     data['currentPage'] = this.currentPage;
//     data['totalPages'] = this.totalPages;
//     return data;
//   }
// }
class ReviewModel {
  bool? status;
  var message;
  List? data;
  Pagination? pagination;

  ReviewModel({this.status, this.message, this.data, this.pagination});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Null>[];
      json['data'].forEach((v) {
        data!.add(v);
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

class Pagination {
  var total;
  var count;
  var perPage;
  var currentPage;
  var totalPages;

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