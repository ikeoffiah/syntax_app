import 'package:flutter/material.dart';
import 'package:syntax_app/helper/response.dart';
import 'package:syntax_app/helper/shared_preferences.dart';
import 'package:syntax_app/main.dart';
import 'package:syntax_app/models/auth/register_model.dart';
import 'package:syntax_app/requests/auth_requests.dart';
import 'package:syntax_app/screens/nav/nav_screen.dart';

/// Manages the registration process for users.
class RegisterWithGoogleViewModel {
  /// Creates a [RegisterWithGoogleViewModel] instance.
  ///
  /// [context] is the current build context.
  /// [onChangeValue] is a callback function to update the UI state.
  RegisterWithGoogleViewModel({
    required this.context,
    required this.onChangeValue,
  });

  /// The current build context.
  final BuildContext context;

  /// Callback function to update the UI state.
  final dynamic Function(bool) onChangeValue;

  /// Registers an individual user with the provided data.
  ///

  Future<void> registerIndividual({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    final Map<String, dynamic> userData = <String, dynamic>{
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
    };

    final Map<String, dynamic> response =
        await registerUserWithGoogle(userData);

    ResponseFunction(
      showToast: false,
      response: response,
      successFunction: () {
        final SignUpResponse userDetail = SignUpResponse.fromJson(response);

        sharedPreferences
          ..setString(accessToken, userDetail.data.token.access)
          ..setString("firstName", userDetail.data.firstName)
          ..setString("lastName", userDetail.data.lastName);

        onChangeValue(true);
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const NavigationScreen(),
          ),
        );
      },
      errorStateFunction: () {
        onChangeValue(false);
      },
      successStateFunction: () {},
    ).responseFunction("Google sig up was successful");
  }
}
