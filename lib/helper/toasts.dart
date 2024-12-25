import 'package:flutter/material.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

import 'package:toastification/toastification.dart';

/// error toast
ToastificationItem errorToast(String message) => toastification.show(
      title: const Text("Error"),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      description: RichText(
        text: TextSpan(text: message, style: primaryColorInter12600),
      ),
      type: ToastificationType.error,
      showProgressBar: false,
      style: ToastificationStyle.flatColored,
    );

/// success toast
ToastificationItem successToast(String message) => toastification.show(
      title: const Text("Success"),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 3),
      description: RichText(
        text: TextSpan(text: message, style: primaryColorInter12600),
      ),
      type: ToastificationType.success,
      showProgressBar: false,
      style: ToastificationStyle.flatColored,
    );

/// info toast
ToastificationItem infoToast(String message) => toastification.show(
      title: const Text("Info"),
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      description: RichText(
        text: TextSpan(text: message, style: primaryColorInter12600),
      ),
      type: ToastificationType.info,
      showProgressBar: false,
      style: ToastificationStyle.flatColored,
    );
