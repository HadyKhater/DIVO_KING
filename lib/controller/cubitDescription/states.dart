abstract class DescriptionStates {}

class DescriptionInitialStates extends DescriptionStates{}

class DescriptionLoadingStates extends DescriptionStates{}

class DescriptionSuccessStates extends DescriptionStates{}

class DescriptionErrorStates extends DescriptionStates{
  final String error;
  DescriptionErrorStates({required this.error});
}