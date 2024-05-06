import 'package:divo_king/controller/cubitBookmark/states.dart';
import 'package:divo_king/model/BookMarkModel/bookmark_model.dart';

import 'package:divo_king/share/Dio/dio.dart';
import 'package:divo_king/share/cache/cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookMarkCubit extends Cubit<BookMarkStates>{
  BookMarkCubit():super(BookMarkInitialStates());
  static BookMarkCubit get(context)=>BlocProvider.of(context);
  BookmarkModel? bookmarkModel;
   getBookMark(){
    emit(BookMarkLoadingStates());
    DioHelper.getData(url: 'bookmark',
        token: CashHelper.getData(key: 'token'),
        ).then((value){
          emit(BookMarkSuccessStates());
          bookmarkModel = BookmarkModel.fromJson(value.data);
          print(value.data);
    }).catchError((error){
      emit(BookMarkErrorStates(error: error.toString()));
      print('BOOKMARK ERROR => ${error.toString()}');
    });
  }
}