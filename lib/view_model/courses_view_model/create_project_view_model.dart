import 'package:syntax_app/helper/response.dart';
import 'package:syntax_app/requests/courses_requests.dart';

/// ViewModel class responsible for submitting test.

class CreateProjectViewModel {
  /// Constructor for the ViewModel, initializing the callback function
  /// and context.
  CreateProjectViewModel({required this.onChangeValue});

  /// Callback function triggered when the value changes.
  final dynamic Function(bool) onChangeValue;

  /// Submit test results
  Future<void> submitProject({
    required String topic,
    required String url,
  }) async {
    final Map<String, dynamic> userData = <String, dynamic>{
      "topic": topic,
      "file_u": url,
    };

    // API request to submit results.
    final Map<String, dynamic> response =
        await submitCustomProjectRequest(userData);

    // Handling the response from the API request with success or error callbacks.
    ResponseFunction(
      showToast: false,
      response: response,
      successFunction: () {
        onChangeValue(true);
      },
      errorStateFunction: () {
        onChangeValue(false);
      },
      successStateFunction: () {},
    ).responseFunction("");
  }
}
