import 'package:syntax_app/helper/response.dart';
import 'package:syntax_app/models/user/user_model.dart';
import 'package:syntax_app/requests/user_requests.dart';

/// ViewModel for fetching questions.
class FetchUserViewModel {
  /// Constructor for FetchUserViewModel.
  FetchUserViewModel({
    required this.onChangeValue,
    required this.getData,
  });

  /// Callback function that gets triggered when the value changes.
  final dynamic Function(bool) onChangeValue;

  /// Callback function that gets triggered when the incident data is fetched.
  final dynamic Function(UserData) getData;

  /// function to get incident data
  Future<void> getUserProfile() async {
    final Map<String, dynamic> response = await getUserProfileRequest();

    ResponseFunction(
      showErrorToast: false,
      response: response,
      showToast: false,
      successFunction: () {
        final UserResponse user = UserResponse.fromJson(response);

        getData(user.data);

        onChangeValue(true);
      },
      errorStateFunction: () {
        onChangeValue(false);
      },
      successStateFunction: () {},
    ).responseFunction(null);
  }
}
