import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/helper/shared_preferences.dart';
import 'package:syntax_app/requests/base_request_template.dart';

/// auth token
String authToken = getAccessToken();

/// Fetch all alert violations
Future<Map<String, dynamic>> getQuestionsRequest() {
  String url = "$baseUrl/courses/test";
  url = Uri.parse(url).toString();
  return baseGetCallAuth(url, authToken);
}

/// submit test

Future<Map<String, dynamic>> submitTestRequest(Map<String, dynamic> userData) {
  String url = "$baseUrl/courses/submit-test";
  url = Uri.parse(url).toString();
  return basePostCallAuth(url, userData, authToken);
}
