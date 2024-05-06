// import 'package:divo_king/controller/forgotPassword/states.dart';
// import 'package:divo_king/share/Dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ForgotPasswordCubit extends Cubit<ForgotPasswordStates>{
//
//   ForgotPasswordCubit():super(ForgotPasswordInitialStates());
//
//   static ForgotPasswordCubit get(context)=>BlocProvider.of(context);
//
//   ForgotPasswordUser({
//     required String email,
// }){
//     emit(ForgotPasswordLoadingStates());
//     DioHelper.postData(url: 'auth/forget-password',
//         data: {
//       'email': email
//         }).then((value){
//           emit(ForgotPasswordSuccessStates());
//     }).catchError((error){
//       emit(ForgotPasswordErrorStates(error: error.toString()));
//     });
//   }
// }