abstract class HomeStates {}

class HomeInitialStates extends HomeStates{}

class HomeLoadingStates extends HomeStates{}

class HomeSuccessStates extends HomeStates{}

class HomeErrorStates extends HomeStates{
  final String error;

  HomeErrorStates({required this.error});

}