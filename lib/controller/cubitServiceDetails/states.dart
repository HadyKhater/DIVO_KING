abstract class ServiceDetailsStates{}

class ServiceDetailsInitialStates extends ServiceDetailsStates{}

class ServiceDetailsLoadingStates extends ServiceDetailsStates{}

class ServiceDetailsSuccessStates extends ServiceDetailsStates{}

class ServiceDetailsErrorStates extends ServiceDetailsStates{
  final String error;

  ServiceDetailsErrorStates({required this.error});
}