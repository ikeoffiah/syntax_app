// -------------------User registration----------------

import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/requests/base_request_template.dart';

/// Register users
Future<Map<String, dynamic>> registerUser(Map<String, dynamic> userData) {
  String url = "$baseUrl/auth/register";
  url = Uri.parse(url).toString();

  return basePostCallNoAuth(url, userData);
}

/// Login users
Future<Map<String, dynamic>> loginUser(Map<String, dynamic> userData) {
  String url = "$baseUrl/auth/login";

  url = Uri.parse(url).toString();

  return basePostCallNoAuth(url, userData);
}

/// sign up with google
Future<Map<String, dynamic>> registerUserWithGoogle(
  Map<String, dynamic> userData,
) {
  String url = "$baseUrl/auth/register-google";
  url = Uri.parse(url).toString();

  return basePostCallNoAuth(url, userData);
}
