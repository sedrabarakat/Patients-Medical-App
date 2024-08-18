import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/core/data/models/patient_model.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/helper/image_helper.dart';
import 'package:patient_app/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../../../../core/data/models/user_model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;
  AuthCubit(this._repo) : super(AuthInitial());
  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  final loginFormState = GlobalKey<FormState>();
  final signUpFormState = GlobalKey<FormState>();

  final formStateVerify = GlobalKey<FormState>();
  //login controller
  final TextEditingController phoneController = TextEditingController();

  //sign up controller
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController registerPhoneNumberController =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController habitsController = TextEditingController();
  final TextEditingController childrenNumberController =
      TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  late int age;
  Uint8List? pickedProfileImage;
  PatientModel? userData;
  late String birthdayDate = '';
  String selectedMaritalStatus = 'None';
  String selectedBloodType = 'A+';
  String selectedGender = 'Male';
  int diabetes = 0;
  int bloodPressure = 0;
  bool isFinished = true;
  int waitSeconds = 10;
  ButtonState requestCodeButtonState = ButtonState.idle;
  ButtonState registerButtonState = ButtonState.idle;

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

  Future<void> register() async {
    registerButtonState = ButtonState.loading;
    emit(SignUpLoadingState());
    List<String> names = splitName(fullNameController.text);
    final response = await _repo.register(
      firstName: names[0],
      middleName: names[1],
      lastName: names[2],
      phoneNumber: registerPhoneNumberController.text,
      birthDate: dateController.text,
      address: addressController.text,
      gender: selectedGender.toLowerCase(),
      bloodType: selectedBloodType,
      maritalStatus: selectedMaritalStatus.toLowerCase(),
      proffesion: professionController.text,
      diabetes: diabetes,
      bloodPressure: bloodPressure,
      wallet: 1000,
      age: age.toString(),
      description: descriptionController.text.isEmpty
          ? null
          : descriptionController.text,
      image: pickedProfileImage,
      habits: habitsController.text.isEmpty ? null : habitsController.text,
      childrenNum: childrenNumberController.text.isEmpty
          ? null
          : int.parse(childrenNumberController.text),
    );
    response.fold((error) {
      registerButtonState = ButtonState.fail;
      emit(SignUpFailureState(error: error));
    }, (data) {
      registerButtonState = ButtonState.idle;
      clearSignUpControllers();
      emit(SignUpSuccessState(userData: data.data!));
    });
  }

  Future<void> getMyInformation() async {
    emit(GetMyInformationLoadingState());
    final response = await _repo.getMyInformation();
    response.fold(
      (error) {
        print(NetworkExceptions.getErrorMessage(error));
        emit(GetMyInformationErrorState(error));
      },
      (data) {
        userData = data.data!;
        emit(GetMyInformationSuccessState(data.data!));
      },
    );
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
      age = calculateAge(picked);

      dateController.text = formattedDate;
    }
  }

  void changeMaritalStatus(String value) {
    selectedMaritalStatus = value;
    emit(MaritalStatusSelectedState());
  }

  List<String> splitName(String fullName) {
    List<String> names = fullName.split(' ');
    return names;
  }

  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    // Check if the birthday has occurred this year
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  void clearSignUpControllers() {
    fullNameController.clear();
    registerPhoneNumberController.clear();
    dateController.clear();
    professionController.clear();
    habitsController.clear();
    addressController.clear();
    descriptionController.clear();
    selectedMaritalStatus = "None";
    childrenNumberController.clear();
    diabetes = 0;
    bloodPressure = 0;
    selectedGender = "Male";
    selectedBloodType = 'A+';
    pickedProfileImage = null;
  }

  void finishTime() {
    isFinished = true;
    waitSeconds *= 2;
    emit(FinishTimeState());
  }

  Future<void> pickImage() async {
    try {
      final pickedImage = await ImageHelper.pickImage(ImageSource.camera);

      if (pickedImage != null) {
        pickedProfileImage = await pickedImage.readAsBytes();

        emit(PickImageState());
      }
    } catch (e) {
      // todo handle this error correctly
      print(e);
    }
  }
}
