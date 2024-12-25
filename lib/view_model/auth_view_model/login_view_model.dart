import 'package:flutter/material.dart';
import 'package:syntax_app/helper/response.dart';
import 'package:syntax_app/helper/shared_preferences.dart';
import 'package:syntax_app/main.dart';
import 'package:syntax_app/models/auth/login_model.dart';
import 'package:syntax_app/requests/auth_requests.dart';

/// ViewModel for handling login functionality.
class LoginViewModel {
  /// Creates a [LoginViewModel] instance.
  ///
  /// [email] The user's email address.
  /// [password] The user's password.
  /// [context] The current build context.
  /// [onChangeValue] Callback function to update UI state.
  LoginViewModel({
    required this.email,
    required this.password,
    required this.context,
    required this.onChangeValue,
  });

  /// The user's email address.
  final String email;

  /// The user's password.
  final String password;

  /// The current build context.
  final BuildContext context;

  /// Callback function to update UI state.
  final dynamic Function(bool) onChangeValue;

  /// Performs the login operation.
  ///
  /// Sends a login request to the server, processes the response,
  /// and updates the app state accordingly.
  Future<void> login() async {
    final Map<String, dynamic> userData = <String, dynamic>{
      "email": email,
      "password": password,
    };

    final Map<String, dynamic> response = await loginUser(userData);

    ResponseFunction(
      response: response,
      successFunction: () {
        final LoginResponse userDetail = LoginResponse.fromJson(response);

        sharedPreferences
          ..setString(accessToken, userDetail.token.access)
          ..setString(firstName, userDetail.firstName)
          ..setString(lastName, userDetail.lastName);

        onChangeValue(true);
      },
      errorStateFunction: () {
        onChangeValue(false);
      },
      successStateFunction: () {},
    ).responseFunction("Login was successful");
  }
}
