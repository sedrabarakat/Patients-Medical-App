import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:patient_app/core/domain/error_handler/network_exceptions.dart';
import 'package:patient_app/core/helper/color_helper.dart';
import 'package:patient_app/core/widgets/toast_widget.dart';

enum ToastStatus {
  success,
  failure,
}

class ToastBar {
  static const int spalshDelay = 5;
  static const int spalshDelayAppName = 200;

  static showTOAST(
    BuildContext context, {
    required String textToast,
    required String title,
    required ToastStatus status,
  }) {
    showToastWidget(
        duration: const Duration(seconds: 5),
        ToastWidget(
          title: title,
          description: textToast,
          icon: ToastStatus.failure != status
              ? Icons.info
              : ToastStatus.success == status
                  ? Icons.check_circle
                  : null,
          color: ToastStatus.failure != status
              ? ColorsHelper.primary
              : Colors.redAccent,
        ),
        context: context,
        position: StyledToastPosition.top);
  }

  static onSuccess(BuildContext context,
      {required String message, required String title}) {
    showTOAST(
      context,
      textToast: message,
      title: title,
      status: ToastStatus.success,
    );
  }

  static onNetworkFailure(BuildContext context,
      {required NetworkExceptions networkException, String? title}) {
    showTOAST(
      context,
      textToast: NetworkExceptions.getErrorMessage(networkException),
      title: 'Error',
      status: ToastStatus.failure,
    );
  }
}
