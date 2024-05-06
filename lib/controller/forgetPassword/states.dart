abstract class ForgotPasswordStates{}

class ForgotPasswordInitialStates extends ForgotPasswordStates{}

class ForgotPasswordLoadingStates extends ForgotPasswordStates{}

class ForgotPasswordSuccessStates extends ForgotPasswordStates{}

class ForgotPasswordErrorStates extends ForgotPasswordStates{
  final String error;

  ForgotPasswordErrorStates({required this.error});
}
