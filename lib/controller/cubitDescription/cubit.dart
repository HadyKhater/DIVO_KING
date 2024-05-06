import 'package:divo_king/controller/cubitDescription/states.dart';
import 'package:divo_king/model/DescriptionModel/description_model.dart';
import 'package:divo_king/model/ServiceDetailsModel/service_details_model.dart';
import 'package:divo_king/share/Dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionCubit extends Cubit<DescriptionStates>{

  DescriptionCubit():super(DescriptionInitialStates());

  static DescriptionCubit get(context)=>BlocProvider.of(context);
  ServiceDetails? serviceDetails;
  getDescription(id){
    emit(DescriptionLoadingStates());
    DioHelper.getData(url:'services/details/$id'
    ).then((value) {
      serviceDetails = ServiceDetails.fromJson(value.data);
      print(value.data);
      emit(DescriptionSuccessStates());
    }).catchError((error){
      emit(DescriptionErrorStates(error: error.toString()));
      print(error.toString());
    });
  }
}