import 'package:syntax_app/helper/response.dart';
import 'package:syntax_app/models/user/user_results_model.dart';
import 'package:syntax_app/requests/courses_requests.dart';

/// ViewModel class responsible for submitting test.

class SubmitTestViewModel {
  /// Constructor for the ViewModel, initializing the callback function
  /// and context.
  SubmitTestViewModel({required this.onChangeValue, required this.getResults});

  /// Callback function triggered when the value changes.
  final dynamic Function(bool) onChangeValue;

  /// Callback function for returning results
  final dynamic Function(UserResultModel) getResults;

  /// Submit test results
  Future<void> submitResult({
    required List<Map<String, dynamic>> result,
  }) async {
    final Map<String, dynamic> userData = <String, dynamic>{
      "submissions": result,
    };

    // API request to submit results.
    final Map<String, dynamic> response = await submitTestRequest(userData);

    // Handling the response from the API request with success or error callbacks.
    ResponseFunction(
      response: response,
      successFunction: () {
        onChangeValue(true);
        final UserResultModel results = UserResultModel.fromJson(response);
        getResults(results);
      },
      errorStateFunction: () {
        onChangeValue(false);
      },
      successStateFunction: () {},
    ).responseFunction("Fuel logs added successfully");
  }
}
