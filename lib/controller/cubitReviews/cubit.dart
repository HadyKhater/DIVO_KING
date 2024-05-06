import 'package:divo_king/controller/cubitReviews/states.dart';
import 'package:divo_king/model/ReviewModel/review_model.dart';
import 'package:divo_king/share/Dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsCubit extends Cubit<ReviewsStates>{
  ReviewsCubit():super(ReviewsInitialStates());
  static ReviewsCubit get(context)=>BlocProvider.of(context);
  ReviewModel? reviewModel;
  getReviews(id){
    emit(ReviewsLoadingStates());
    DioHelper.getData(url:'diving-center/reviews/$id',
    ).then((value){
      reviewModel = ReviewModel.fromJson(value.data);
      print(value.data);
      emit(ReviewsSuccessStates());
    }).catchError((error){
      emit(ReviewsErrorStates(error: error.toString()));
      print('REVIEW ERROR=>${error.toString()}');
    });
  }
}