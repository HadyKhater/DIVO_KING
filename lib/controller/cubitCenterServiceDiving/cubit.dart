import 'package:divo_king/controller/cubitCenterServiceDiving/states.dart';
import 'package:divo_king/model/CenterServiceDiving/center_service_diving.dart';
import 'package:divo_king/share/Dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterServiceDivingCubit extends Cubit<CenterServiceDivingStates>{
  CenterServiceDivingCubit():super (CenterServiceDivingInitialStates());
  static CenterServiceDivingCubit get(context)=>BlocProvider.of(context);
   CenterServiceDivingModel? centerServiceDivingModel;
  getCenterServiceDiving(){
    emit(CenterServiceDivingLoadingStates());
    DioHelper.getData(url: 'services'
    ).then((value){
      centerServiceDivingModel = CenterServiceDivingModel.fromJson(value.data);
      print(value.data);
      emit(CenterServiceDivingSuccessStates());
    }).catchError((error){
      emit(CenterServiceDivingErrorStates(error: error.toString()));
    });
  }
}