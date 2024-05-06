abstract class DivingReviewsStates{}
class DivingReviewsInitialStates extends DivingReviewsStates{}

class DivingReviewsLoadingStates extends DivingReviewsStates{}

class DivingReviewsSuccessStates extends DivingReviewsStates{}

class DivingReviewsErrorStates extends DivingReviewsStates{
  final String error;

  DivingReviewsErrorStates({required this.error});
}
