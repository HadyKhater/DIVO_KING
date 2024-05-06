abstract class CenterDetailsStates{}

class CenterDetailsInitialStates extends CenterDetailsStates{}
class CenterDetailsLoadingStates extends CenterDetailsStates{}
class CenterDetailsSuccessStates extends CenterDetailsStates{}
class CenterDetailsErrorStates extends CenterDetailsStates{
  final String error;

  CenterDetailsErrorStates({required this.error});
}