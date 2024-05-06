abstract class AuthStates {}

class AuthInitialStates extends AuthStates{}

class AuthLoadingStates extends AuthStates{}

class AuthSuccessStates extends AuthStates{}

class AuthErrorStates extends AuthStates{
  final String error;

  AuthErrorStates({required this.error});
}

class AuthChangePasswordVisibilityStates extends AuthStates{}

