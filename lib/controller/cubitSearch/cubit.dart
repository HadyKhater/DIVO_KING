import 'package:divo_king/controller/cubitSearch/states.dart';
import 'package:divo_king/model/FilterModel/filter_model.dart';
import 'package:divo_king/model/SearchModel/search_model.dart';
import 'package:divo_king/share/Dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialStates());
  static SearchCubit get(context) => BlocProvider.of(context);
SearchModel? searchModel;
FilterModel?filterModel;
      Search(
      {String? status,
       String? name,
       // double? minPrice,
       // double? maxPrice,
       // String? address,
       // String? id
      }) {
        searchModel = null;
    emit(SearchLoadingStates());
    DioHelper.postData(
        url: 'search',
        data: {'type': status,
          'name':name
    }).then((value) {
      emit(SearchSuccessStates());
      searchModel = SearchModel.fromJson(value.data);
      print(value.data);
    }).catchError((error) {
      emit(SearchErrorStates(error: error.toString()));
      print('SEARCH ERROR => ${error.toString()}');
    });
  }
  DataSearch({
    String? status,
    String? name,
    String? location,
    String? service,
    String? minPrice,
    String? maxPrice,
}){
        searchModel = null;
    emit(DataSearchLoadingStates());
DioHelper.postData(url: 'search', data: {
  'type':status,
  'name':name,
  'address':location,
  'service':service,
  'min_price':minPrice,
  'max_price':maxPrice,
}).then((value) {
  emit(DataSearchSuccessStates());
  searchModel = SearchModel.fromJson(value.data);
  print(value.data);
}).catchError((error){
  emit(DataSearchErrorStates(error: error.toString()));
  print('SEARCH ERROR =>$error');
});
  }

  FilterSearch({
    required String status,
    required String text,
    required String location,
    required String id
}){
        emit(FilterSearchLoadingStates());
        DioHelper.postData(url: 'search', data: {
          'type':status,
          'name':text,
          'address':location,
          'service':id
        }).then((value){
          emit(FilterSearchSuccessStates());
          searchModel = SearchModel.fromJson(value.data);
          print(value.data);
        }).catchError((error){
          emit(SearchErrorStates(error: error.toString()));
          print('ERROR FILTER =>${error.toString()}');
        });
  }

  Filters() {
    DioHelper.getData(url: 'search/data',
    ).then((value) {
      emit(FilterSuccessStates());
      filterModel = FilterModel.fromJson(value.data);
      print(value.data);
    }).catchError((error) {
      emit(FilterErrorStates(error: error.toString()));
      print('ERRRROOOORRR FIILTTEERRR =>${error.toString()}');
    });
  }
  int selectedOption = 0;

  void setSelectedOption(int option) {
    selectedOption = option;
    emit(SearchLoadingStates());
  }
  bool  onPressed = false;

  void changButton(){
    onPressed =! onPressed;
    emit(ChangButtonState());
  }
}
