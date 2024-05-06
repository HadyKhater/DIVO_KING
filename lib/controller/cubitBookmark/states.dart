abstract class BookMarkStates {}

class BookMarkInitialStates extends BookMarkStates{}

class BookMarkLoadingStates extends BookMarkStates{}

class BookMarkSuccessStates extends BookMarkStates{}

class BookMarkErrorStates extends BookMarkStates{
  final String error;

  BookMarkErrorStates({required this.error});
}