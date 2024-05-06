import 'package:divo_king/controller/cubitBooking/states.dart';
import 'package:divo_king/model/BookingModel/booking_model.dart';
import 'package:divo_king/share/Dio/dio.dart';
import 'package:divo_king/share/cache/cache.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCubit extends Cubit<BookingStates> {
  BookingCubit() : super(BookingInitialStates());
  static BookingCubit get(context) => BlocProvider.of(context);
  BookingModel? bookingModel;
  getBooking({required String status}) {

    emit(BookingLoadingStates());
    DioHelper.getData(url: 'orders',
      token: CashHelper.getData(key: 'token')
    )
        .then((value) {
      emit(BookingSuccessStates());
      bookingModel = BookingModel.fromJson(value.data);
      print(value.data);

      print(value.data);
    }).catchError((error) {
      emit(BookingErrorStates(error: error.toString()));
      print('MY ORDER ERROR => ${error.toString()}');
    });
  }
}
