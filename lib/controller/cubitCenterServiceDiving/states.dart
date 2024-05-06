abstract class CenterServiceDivingStates{}

class CenterServiceDivingInitialStates extends CenterServiceDivingStates{}

class CenterServiceDivingLoadingStates extends CenterServiceDivingStates{}

class CenterServiceDivingSuccessStates extends CenterServiceDivingStates{}

class CenterServiceDivingErrorStates extends CenterServiceDivingStates{
  final String error;
  CenterServiceDivingErrorStates({required this.error});
}