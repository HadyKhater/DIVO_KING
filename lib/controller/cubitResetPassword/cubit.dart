import 'package:divo_king/controller/cubitResetPassword/states.dart';
import 'package:divo_king/share/Dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates>{
  ResetPasswordCubit():super(ResetPasswordInitialStates());

  static ResetPasswordCubit get(context)=>BlocProvider.of(context);
  
  ResetPasswordUser({
    required int otp,
    required String password,
    required String password_confirmation,
}){
    emit(ResetPasswordLoadingStates());
    DioHelper.postData(
        url: 'auth/reset-password',
        data: {
      'otp':otp,
        'password':password,
          'password_confirmation':password_confirmation,
        }).then((value){
          emit(ResetPasswordSuccessStates());
    }).catchError((error){
      emit(ResetPasswordErrorStates(error: error.toString()));
    });
  }
}