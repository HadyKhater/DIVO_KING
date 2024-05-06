
import 'package:divo_king/controller/cubitAuth/states.dart';
import 'package:divo_king/controller/cubitLogin/states.dart';
import 'package:divo_king/model/LoginModel/login_model.dart';
import 'package:divo_king/model/SignUpModel/signUpModel.dart';

import 'package:divo_king/share/Dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialStates());
  static AuthCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  SignUpModel? signUpModel;
  userLogin({required String email, required String password}) {
    print(email);
    print(password);
    emit(AuthLoadingStates());
    DioHelper.postData(url: 'auth/login', data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(AuthSuccessStates());
      print(value.data);
    }).catchError((error) {
      emit(AuthErrorStates(error: error.toString()));
      print(error.toString());
    });
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AuthChangePasswordVisibilityStates());
  }

  UserSingUp({
  required String email,
  required String password,
  required String name,
  required String phone,
  required String password_confirmation,
  }){
  emit(AuthLoadingStates());
  DioHelper.postData(url:'auth/register',
  data: {
  'name':name,
  'email':email,
  'password':password,
  'password_confirmation':password_confirmation,
  'phone':phone
  }).then((value) {
  print(value.data);
  signUpModel = SignUpModel.fromJson(value.data);
  emit(AuthSuccessStates());
  }).catchError((error){
  emit(AuthErrorStates(error: error.toString()));
  print('Error${error.toString()}');
  });
  }
  // IconData suffix = Icons.visibility_off_outlined;
  // bool isPassword = true;
  // void changePasswordVisibility() {
  // isPassword = !isPassword;
  // suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  // emit(SignUpChangePasswordVisibilityStates());
  // }
  // }

UserForgetPassword({
    required String email,
}){
    emit(AuthLoadingStates());
    DioHelper.postData(url: 'auth/forget-password', data: {
      'email':email,
    }).then((value) {
      print(value.data);
      emit(AuthSuccessStates());
    }).catchError((error){
      emit(AuthErrorStates(error: error.toString()));
    });
}
}
