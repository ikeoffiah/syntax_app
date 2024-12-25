// /user/
import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/helper/shared_preferences.dart';
import 'package:syntax_app/requests/base_request_template.dart';

/// auth token
String authToken = getAccessToken();

/// Fetch all alert violations
Future<Map<String, dynamic>> getUserProfileRequest() {
  String url = "$baseUrl/user/";
  url = Uri.parse(url).toString();
  return baseGetCallAuth(url, authToken);
}
