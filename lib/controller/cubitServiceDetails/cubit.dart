import 'package:divo_king/controller/cubitServiceDetails/states.dart';
import 'package:divo_king/model/ServiceDetailsModel/service_details_model.dart';
import 'package:divo_king/share/Dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceDetailsCubit extends Cubit<ServiceDetailsStates>{
  ServiceDetailsCubit():super (ServiceDetailsInitialStates());
  static ServiceDetailsCubit get(context) => BlocProvider.of(context);
  ServiceDetails? serviceDetails;
  getServiceDetails(id){
    emit(ServiceDetailsLoadingStates());
  DioHelper.getData(url: 'services/details/$id',
  ).then((value) {
    print(value.data);
    serviceDetails = ServiceDetails.fromJson(value.data);
    emit(ServiceDetailsSuccessStates());
  }).catchError((error){
    print(error.toString());
    emit(ServiceDetailsErrorStates(error: error.toString()));
  });

  }
}