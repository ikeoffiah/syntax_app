import 'package:syntax_app/main.dart';

/// access token
const String accessToken = "accessToken";

/// first name
const String firstName = "firstName";

/// last name
const String lastName = "lastName";

/// Get access token stored using shared preferences
String getAccessToken() => sharedPreferences.getString(accessToken)!;

/// Get user first Name
String getFirstName() => sharedPreferences.getString(firstName)!;

/// check if user is logged in
bool isLoggedIn() {
  if (sharedPreferences.getString(accessToken) == null ||
      sharedPreferences.getString(accessToken) == '') {
    return false;
  } else {
    return true;
  }
}
