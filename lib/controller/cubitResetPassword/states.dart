abstract class ResetPasswordStates {}

class ResetPasswordInitialStates extends ResetPasswordStates{}

class ResetPasswordLoadingStates extends ResetPasswordStates{}

class ResetPasswordSuccessStates extends ResetPasswordStates{}

class ResetPasswordErrorStates extends ResetPasswordStates{
  final String error;

  ResetPasswordErrorStates({required this.error});
}