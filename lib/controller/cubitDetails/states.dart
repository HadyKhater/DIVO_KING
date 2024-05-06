abstract class DetailsStates{}

class DetailsInitialStates extends DetailsStates{}
class DetailsLoadingStates extends DetailsStates{}
class DetailsSuccessStates extends DetailsStates{}
class DetailsErrorStates extends DetailsStates{
  final String error;

  DetailsErrorStates({required this.error});
}