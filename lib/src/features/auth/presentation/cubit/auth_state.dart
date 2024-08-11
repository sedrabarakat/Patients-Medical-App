part of 'auth_cubit.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

//login
final class RequestCodeLoadingState extends AuthState {}

final class RequestCodeSuccessState extends AuthState {
  String message;
  RequestCodeSuccessState({required this.message});
}

final class RequestCodeErrorState extends AuthState {
  final NetworkExceptions error;
  RequestCodeErrorState({required this.error});
}

//verify code
final class VerifyCodeLoadingState extends AuthState {}

final class VerifyCodeSuccessState extends AuthState {
  final UserModel userData;
  VerifyCodeSuccessState({required this.userData});
}

final class VerifyCodeErrorState extends AuthState {
  final NetworkExceptions error;
  VerifyCodeErrorState({required this.error});
}

//sign up
final class SignUpLoadingState extends AuthState {}

final class SignUpSuccessState extends AuthState {
  final PatientModel userData;
  SignUpSuccessState({required this.userData});
}

final class SignUpFailureState extends AuthState {
  final NetworkExceptions error;
  SignUpFailureState({required this.error});
}


final class MaritalStatusSelectedState extends AuthState {}


class FinishTimeState extends AuthState {}

class PickImageState extends AuthState {}
