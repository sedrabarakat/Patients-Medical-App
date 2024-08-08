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
  final PersonalInformationModel userData;
  VerifyCodeSuccessState({required this.userData});
}

final class VerifyCodeErrorState extends AuthState {
  final NetworkExceptions error;
  VerifyCodeErrorState({required this.error});
}

//sign up
final class SignUpSuccessState extends AuthState {}

final class SignUpFailureState extends AuthState {}

final class ResetDateState extends AuthState {}

final class DateSelectedState extends AuthState {
  final DateTime selectedDate;
  DateSelectedState(this.selectedDate);
}

final class MaritalStatusSelectedState extends AuthState {}

final class DiabetesToggledState extends AuthState {
  final bool isChecked;
  DiabetesToggledState(this.isChecked);
}

final class BloodPressureToggledState extends AuthState {
  final bool isChecked;
  BloodPressureToggledState(this.isChecked);
}

class FinishTimeState extends AuthState {}
