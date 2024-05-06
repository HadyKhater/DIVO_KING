abstract class SearchStates{}

class SearchInitialStates extends SearchStates{}

class SearchLoadingStates extends SearchStates{}

class SearchSuccessStates extends SearchStates{}

class SearchErrorStates extends SearchStates{
  final String error;

  SearchErrorStates({required this.error});
}

class DataSearchLoadingStates extends SearchStates{}

class DataSearchSuccessStates extends SearchStates{}

class DataSearchErrorStates extends SearchStates{
  final String error;

  DataSearchErrorStates({required this.error});
}

class FilterSearchLoadingStates extends SearchStates{}

class FilterSearchSuccessStates extends SearchStates{}

class FilterSearchErrorStates extends SearchStates {
  final String error;

  FilterSearchErrorStates({required this.error});
}

class FilterLoadingStates extends SearchStates{}

class FilterSuccessStates extends SearchStates{}

class FilterErrorStates extends SearchStates{
  final String error;

  FilterErrorStates({required this.error});
}

class ChangButtonState extends SearchStates{}
