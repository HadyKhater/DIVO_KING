abstract class BookingStates {}

class BookingInitialStates extends BookingStates{}
class BookingLoadingStates extends BookingStates{}
class BookingSuccessStates extends BookingStates{}
class BookingErrorStates extends BookingStates{
  final String error;

  BookingErrorStates({required this.error});
}