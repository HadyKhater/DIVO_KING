// import 'package:divo_king/controller/cubitSignUp/cubit/states.dart';
//
// import 'package:divo_king/share/Dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class SingUpCubit extends Cubit<SingUpStates>{
//
//   SingUpCubit():super(SingUpInistialStates());
//
//   static SingUpCubit get(context)=>BlocProvider.of(context);
//
//    UserSingUp({
//     required String email,
//     required String password,
//     required String name,
//     required String phone,
//     required String password_confirmation,
//   }){
//      emit(SingUpLoadingStates());
//     DioHelper.postData(url:'auth/register',
//         data: {
//           'name':name,
//           'email':email,
//           'password':password,
//           'password_confirmation':password_confirmation,
//           'phone':phone
//         }).then((value) {
//       print(value.data);
//       emit(SingUpSuccessStates());
//     }).catchError((error){
//       emit(SingUpErrorStates(error: error.toString()));
//     });
//   }
//   IconData suffix = Icons.visibility_off_outlined;
//   bool isPassword = true;
//   void changePasswordVisibility() {
//     isPassword = !isPassword;
//     suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
//     emit(SignUpChangePasswordVisibilityStates());
//   }
// }