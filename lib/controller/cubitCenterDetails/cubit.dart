import 'package:divo_king/controller/cubitCenterDetails/states.dart';
import 'package:divo_king/model/CenterDetailsModel/center_Details.dart';
import 'package:divo_king/share/Dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CenterDetailsCubit extends Cubit<CenterDetailsStates>{
  CenterDetailsCubit():super(CenterDetailsInitialStates());
  static CenterDetailsCubit get(context)=>BlocProvider.of(context);
  CenterDetailsModel? centerDetailsModel;
  getCenterDetails(id){
    emit(CenterDetailsLoadingStates());
    DioHelper.getData(url: 'diving-center/$id',
    ).then((value){
      centerDetailsModel = CenterDetailsModel.fromJson(value.data);
      print(value.data);
      emit(CenterDetailsSuccessStates());
    }).catchError((error){
      emit(CenterDetailsErrorStates(error: error.toString()));
      print('ERROR CENTER DETAILS=>${error.toString()}');
    });
  }
}