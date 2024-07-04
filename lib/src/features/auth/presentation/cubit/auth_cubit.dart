import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/core/utils/color_manager.dart';
import 'package:patient_app/core/utils/string_manager.dart';

import '../../../../../core/routing/app_router.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  final formState = GlobalKey<FormState>();

  final formStateVerify = GlobalKey<FormState>();
  //login controller
  final TextEditingController phoneController = TextEditingController();

  //sign up controller
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController habitsController = TextEditingController();
  final TextEditingController childrenNumberController =
      TextEditingController();
  final TextEditingController professionController = TextEditingController();

  late String birthdayDate = '';
  String selectedMaritalStatus = 'None';
  List<String> maritalStatus = ['None', 'Single', 'Married'];
  bool diabetes = false;
  bool bloodPressure = false;

  //verification code
  final TextEditingController otpController = TextEditingController();
  late String otpCode = '';

  @override
  Future<void> close() {
    phoneController.dispose();
    return super.close();
  }

  void _update(AuthState state) {
    if (isClosed) return;
    emit(state);
  }

  void login() {
    goRouter.pushReplacementNamed(AppRoute.verifyCode.name);
  }

  void verifySubmit(String code) {
    otpCode = code;
    goRouter.pop();
    goRouter.pushReplacementNamed(AppRoute.home.name);
  }

  //sign up
  void resetDate() {
    emit(ResetDateState());
  }

  Future<void> toSelectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
                primary: ColorsManager.primary,
                onPrimary: ColorsManager.white,
                surface: ColorsManager.white,
                onSurface: ColorsManager.black),
            dialogBackgroundColor: ColorsManager.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      dateController.text = formattedDate;
      emit(DateSelectedState(picked));
    }
  }

  void selectHabit(String status) {
    selectedMaritalStatus = status;
    emit(MaritalStatusSelectedState());
  }

  void toggleDiabetes() {
    diabetes = !diabetes;
    emit(DiabetesToggledState(diabetes));
  }

  void toggleBloodPressure() {
    bloodPressure = !bloodPressure;
    emit(BloodPressureToggledState(bloodPressure));
  }

  //verification code fun
  void verifyCode(String code) {
    if (code == "123456") {
      emit(VerifyCodeSuccessState());
    } else {
      emit(VerifyCodeFailureState(AppString.invalidVerifyCode));
    }
  }
}
