import 'package:flutter/material.dart';
import 'package:syntax_app/helper/toasts.dart';
// import 'package:mvi/helpers/toasts.dart';

/// Response function used to control response output
class ResponseFunction {
  /// [ResponseFunction] constructor
  ResponseFunction({
    required this.response,
    required this.successFunction,
    required this.errorStateFunction,
    required this.successStateFunction,
    this.showToast = true,
    this.showErrorToast = true,
  });

  /// actual response
  final Map<String, dynamic> response;

  /// where success logic is written and state change
  final VoidCallback successStateFunction;

  /// if there are errors, logic for errors is written here
  final VoidCallback errorStateFunction;

  /// where success logic is written
  final VoidCallback successFunction;

  /// should success toast show
  bool showToast;

  /// should error toast show
  bool showErrorToast;

  /// response execution
  void responseFunction(String? successMsg) {
    if (response['status'] == 200 || response['status'] == 201) {
      successStateFunction();
      if (showToast) {
        successToast(successMsg!);
      }

      successFunction();
    } else {
      errorStateFunction();

      if (showErrorToast) {
        errorToast(response['detail'] ?? 'Something went wrong');
      }
    }
  }
}
