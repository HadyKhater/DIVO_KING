import 'package:divo_king/controller/cubitHome/states.dart';
import 'package:divo_king/model/HomeModal/home_model.dart';

import 'package:divo_king/share/Dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeCubit():super(HomeInitialStates());
  HomeModel? homeModel;
  static HomeCubit get(context)=>BlocProvider.of(context);

   getDataForHome({
    required String status,
  }){
     emit(HomeLoadingStates());
    DioHelper.getData(
        url:'home',
        query: {
         'filters[type]':status,
        }).then((value) {
          homeModel = HomeModel.fromJson(value.data);
          print(value.data);
          emit(HomeSuccessStates());
    }).catchError((error){
      emit(HomeErrorStates(error: error.toString()));
    });
  }
  int selectedOption = 0;

  void setSelectedOption(int option) {
    selectedOption = option;
    emit(HomeLoadingStates()); 
  }
}