part of 'auth_cubit.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

//login
final class LoginSuccessState extends AuthState{}
final class LoginFailureState extends AuthState{}

//verify code
final class VerifyCodeSuccessState extends AuthState{}
final class VerifyCodeFailureState extends AuthState{
  final String message;

  VerifyCodeFailureState(this.message);

}


//sign up
final class SignUpSuccessState extends AuthState{}
final class SignUpFailureState extends AuthState{}
final class ResetDateState extends AuthState{}
final class DateSelectedState extends AuthState{
  final DateTime selectedDate ;
  DateSelectedState(this.selectedDate);
}
final class MaritalStatusSelectedState extends AuthState{}
final class DiabetesToggledState extends AuthState{
  final bool isChecked;
  DiabetesToggledState(this.isChecked);
}
final class BloodPressureToggledState extends AuthState{
  final bool isChecked;
  BloodPressureToggledState(this.isChecked);
}