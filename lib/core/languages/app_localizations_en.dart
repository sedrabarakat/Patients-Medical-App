import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginWelcome => 'Welcome to \nAl-Naal medical clinic';

  @override
  String get loginSubWelcome => 'You can be connected to us and track your healing process with this app';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get phoneHint => 'ex- 0912345678';

  @override
  String get login => 'Login';

  @override
  String get signup => 'Sign Up';

  @override
  String get dontHaveAccount => '?Don\'t have account';

  @override
  String get fullName => 'Full Name';

  @override
  String get fullNameHint => 'ex- Tuqa Huseen baker';

  @override
  String get birthDate => 'Birth Date';

  @override
  String get birthDateHint => 'select your birth date';

  @override
  String get profession => 'Profession';

  @override
  String get professionHint => 'Enter your profession';

  @override
  String get habits => 'Habits';

  @override
  String get habitsHint => 'Enter your habits';

  @override
  String get maritalStatus => 'MaritialStatus';

  @override
  String get maritalStatusHint => 'select material state';

  @override
  String get none => 'None';

  @override
  String get married => 'Married';

  @override
  String get single => 'Single';

  @override
  String get iHaveDiabetes => 'I have Diabetes';

  @override
  String get iHaveBloodPressure => 'I have Blood-Pressure';

  @override
  String get alreadyHaveAccount => '?Already have account';
}
