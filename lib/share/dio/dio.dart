// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
//
// class DioHelper{
//  static Dio? dio;
//   static initail(){
//     print('intials dio helper');
//     dio = Dio(
//       BaseOptions(
//           baseUrl: 'https://www.divoking.com/api/',
//           receiveDataWhenStatusError: true,
//           headers: {
//             'Accept':'application/json',
//             'Content-Type' : 'multipart/form-data'
//           }
//       )
//     );
//     // dio!.interceptors.add(PrettyDioLogger(
//     //     requestHeader: true,
//     //     requestBody: true,
//     //     responseBody: true,
//     //     responseHeader: true,
//     //     error: true,
//     //     compact: true,
//     //     maxWidth: 90));
//   }
//   static Future<Response> getData({@required url, @required Map<String, dynamic>? query, token})async{
//       dio!.options.headers = {
//         'Accept-Language':'en',
//         'Currency' : 'USD',
//         'Country' : 'Egypt',
//         'Authorization': 'Bearer $token',
//       };
//
//     return await dio!.get(url, queryParameters: query);
//   }
//  static Future<Response> deleteData({@required url, @required Map<String, dynamic>? query,String? token, data,})async{
//    dio!.options.headers = {
//      'Accept':'application/json',
//      'Authorization': 'Bearer $token',
//    };
//    return await dio!.delete(url, queryParameters: query, data: data??null);
//  }
//   static Future<Response> postData({@required url,Map<String, dynamic>? query,String? token, @required Map<String, dynamic>? data,String lang ='en'})async{
//       dio!.options.headers = {
//         'Accept-Language':lang,
//         'Currency' : 'USD',
//         'Country' : 'Egypt',
//         'Authorization': 'Bearer $token',
//       };
//
//     return await dio!.post(url, queryParameters: query, data: data??null);
//   }
//  static Future<Response> postDataSocket({@required url,@required Map<String, dynamic>? query, token, @required Map<String, dynamic>? data})async{
//    dio!.options.headers = {
//      'Content-Type': 'application/x-www-form-urlencoded',
//      'Authorization': 'Bearer ${token}',
//    };
//
//    return await dio!.post(url, queryParameters: query, data: data??null);
//  }
//
//  static Future<Response> updateData({@required url,@required Map<String, dynamic>? query, token, @required Map<String, dynamic>? data})async{
//    dio!.options.headers = {
//      'Accept':'application/json',
//      'Content-Type': 'multipart/form-data',
//      'Authorization': 'Bearer $token',
//    };
//
//    return await dio!.put(url, queryParameters: query, data: data??null);
//  }
//  static Future<dynamic> uploadImage({File? file, url, token}) async {
//     dio!.options.headers = {
//       'Accept':'application/json',
//       'Content-Type': 'multipart/form-data',
//       'Authorization': 'Bearer $token',
//     };
//    var fileName = file!.path.split('/').last;
//    FormData formData = FormData.fromMap({
//      "profile_pic": await MultipartFile.fromFile(file.path, filename:fileName),
//    });
//    var response = await dio!.post(url, data: formData);
//    return response.data;
//  }
//  static Future<dynamic> uploadClinicImage({File? file, url, token, clinicId}) async {
//    dio!.options.headers = {
//      'Accept':'application/json',
//      'Content-Type': 'multipart/form-data',
//      'Authorization': 'Bearer $token',
//    };
//    var fileName = file!.path.split('/').last;
//    FormData formData = FormData.fromMap({
//      "clinic_image": await MultipartFile.fromFile(file.path, filename:fileName),
//      "clinic" : clinicId
//    });
//    var response = await dio!.post(url, data: formData);
//    return response.data;
//  }
// }

 import 'dart:io';
 import 'package:dio/dio.dart';
 import 'package:flutter/material.dart';

 class DioHelper {
   static Dio? dio;

   static init() {
     dio = Dio(BaseOptions(
         baseUrl: 'https://www.divoking.com/api/',
         receiveDataWhenStatusError: true,
         headers: {
           'Accept': 'application/json',
           'Content-Type': 'multipart/form-data',
         }));
   }

   static Future<Response> getData(
       {@required url, Map<String, dynamic>? query, token}) async {
     dio!.options.headers = {
       'Accept':'application/json',
       'Authorization':'Bearer $token',
       'Accept-Language':'en',
       'Currency':'USD',
       'Country':'Egypt'
     };

     return await dio!.get(url, queryParameters: query);
   }

   static Future<Response> postData(
       {
         required url,
       Map<String, dynamic>? query,
       String? token,
       required Map<String, dynamic>? data}) async {
     dio!.options.headers = {
       'Accept':'application/json',
       'Authorization':'$token',
       'Accept-Language':'en',
       'Currency':'USD',
       'Country':'Egypt'

     };

     return await dio!.post(url, queryParameters: query, data: data ?? null);
   }

   static getDateForHome({required String url, required Map<String, String> query}) {}

    static Future<Response> postDataSocket(
        {@required url,
        @required Map<String, dynamic>? query,
        token,
        @required Map<String, dynamic>? data}) async {
      dio!.options.headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${token}',
      };

      return await dio!.post(url, queryParameters: query, data: data ?? null);
    }

    static Future<Response> updateData(
        {@required url,
        @required Map<String, dynamic>? query,
        token,
        @required Map<String, dynamic>? data}) async {
      dio!.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Token $token',
      };

      return await dio!.put(url, queryParameters: query, data: data ?? null);
    }

    static Future<dynamic> uploadImage({File? file, url, token}) async {
      dio!.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Token $token',
      };
      var fileName = file!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "profile_pic":
            await MultipartFile.fromFile(file.path, filename: fileName),
      });
      var response = await dio!.post(url, data: formData);
      return response.data;
    }

    static Future<dynamic> uploadClinicImage(
        {File? file, url, token, clinicId}) async {
      dio!.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Token $token',
      };
      var fileName = file!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "clinic_image":
            await MultipartFile.fromFile(file.path, filename: fileName),
        "clinic": clinicId
      });
      var response = await dio!.post(url, data: formData);
      return response.data;
    }
 }
