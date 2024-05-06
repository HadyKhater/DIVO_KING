//
// import 'package:divo_king/controller/cubitLogin/states.dart';
// import 'package:divo_king/model/LoginModel/login_model.dart';
//
// import 'package:divo_king/share/Dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class LoginCubit extends Cubit<LoginStates> {
//   LoginCubit() : super(LoginInistialStates());
//   static LoginCubit get(context) => BlocProvider.of(context);
//
//   LoginModel? loginModel;
//     userLogin({required String email, required String password}) {
//       print(email);
//       print(password);
//     emit(LoginLoadingStates());
//     DioHelper.postData(url: 'auth/login', data: {
//       'email': email,
//       'password': password,
//     }).then((value) {
//        // loginModel = LoginModel.fromJson(value.data);
//         emit(LoginSuccessStates());
//         print(value.data);
//     }).catchError((error) {
//       emit(LoginErrorStates(error: error.toString()));
//       print(error.toString());
//     });
//   }
//
//   IconData suffix = Icons.visibility_off_outlined;
//   bool isPassword = true;
//   void changePasswordVisibility() {
//     isPassword = !isPassword;
//     suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//     emit(LoginChangePasswordVisibilityStates());
//   }
//
// }
