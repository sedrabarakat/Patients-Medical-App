import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/core/data/models/user_model.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/core/helper/color_helper.dart';

import 'package:patient_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:progress_state_button/progress_button.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;
  AuthCubit(this._repo) : super(AuthInitial());
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
  bool isFinished = true;
  int waitSeconds = 10;
  ButtonState requestCodeButtonState = ButtonState.idle;

  //verification code
  final TextEditingController otpController = TextEditingController();
  late String otpCode = '';

  @override
  Future<void> close() {
    phoneController.dispose();
    return super.close();
  }

  Future<void> requestCode() async {
    requestCodeButtonState = ButtonState.loading;
    isFinished = false;
    emit(RequestCodeLoadingState());

    final response = await _repo.requestCode(phoneController.text);
    response.fold((e) {
      requestCodeButtonState = ButtonState.fail;
      emit(
        RequestCodeErrorState(error: e),
      );
    }, (data) {
      requestCodeButtonState = ButtonState.idle;
      emit(
        RequestCodeSuccessState(message: data.message),
      );
    });
  }

  Future<void> verifyCode() async {
    emit(VerifyCodeLoadingState());
    final response = await _repo.verifyCode(phoneController.text, otpCode);
    response.fold((e) {
      emit(
        VerifyCodeErrorState(error: e),
      );
    }, (data) {
      emit(
        VerifyCodeSuccessState(userData: data.data!),
      );
    });
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
                primary: ColorsHelper.primary,
                onPrimary: ColorsHelper.white,
                surface: ColorsHelper.white,
                onSurface: ColorsHelper.black),
            dialogBackgroundColor: ColorsHelper.white,
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

  void finishTime() {
    isFinished = true;
    waitSeconds *= 2;
    emit(FinishTimeState());
  }
}
