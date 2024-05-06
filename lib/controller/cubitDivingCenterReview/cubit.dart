import 'package:divo_king/controller/cubitDivingCenterReview/states.dart';

import 'package:divo_king/share/Dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DivingReviewsCubit extends Cubit<DivingReviewsStates>{

  DivingReviewsCubit():super(DivingReviewsInitialStates());
  static DivingReviewsCubit get(context)=>BlocProvider.of(context);

   getReview({
    required int reviews,
    required int page
}){
    emit(DivingReviewsLoadingStates());
    DioHelper.getData(url: 'diving-center/reviews',
        query: {
      'filters[limit]':reviews,
          'page':page
        }).then((value){
          emit(DivingReviewsSuccessStates());
    }).catchError((error){
      emit(DivingReviewsErrorStates(error: error.toString()));
    });
  }
}