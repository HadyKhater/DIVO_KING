import 'package:divo_king/controller/cubitDetails/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsStates>{
  DetailsCubit():super(DetailsInitialStates());

  static DetailsCubit get(context)=>BlocProvider.of(context);


}