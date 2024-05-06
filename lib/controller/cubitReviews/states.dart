abstract class ReviewsStates {}

class ReviewsInitialStates extends ReviewsStates{}
class ReviewsLoadingStates extends ReviewsStates{}
class ReviewsSuccessStates extends ReviewsStates{}
class ReviewsErrorStates extends ReviewsStates{
  final String error;

  ReviewsErrorStates({required this.error});

}
