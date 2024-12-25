import 'package:syntax_app/helper/response.dart';
import 'package:syntax_app/models/courses/courses_model.dart';
import 'package:syntax_app/requests/courses_requests.dart';

/// ViewModel for fetching questions.
class FetchQuestionsViewModel {
  /// Constructor for FetchQuestionsViewModel.
  FetchQuestionsViewModel({
    required this.onChangeValue,
    required this.getQuestion,
  });

  /// Callback function that gets triggered when the value changes.
  final dynamic Function(bool) onChangeValue;

  /// Callback function that gets triggered when the incident data is fetched.
  final dynamic Function(List<QuestionModel>) getQuestion;

  /// function to get incident data
  Future<void> getQuestions() async {
    final Map<String, dynamic> response = await getQuestionsRequest();

    ResponseFunction(
      showErrorToast: false,
      response: response,
      showToast: false,
      successFunction: () {
        final List<QuestionModel> questions = (response['data']
                as List<dynamic>)
            .map((item) => QuestionModel.fromJson(item))
            .toList()
          ..shuffle();

        getQuestion(questions);

        onChangeValue(true);
      },
      errorStateFunction: () {
        onChangeValue(false);
      },
      successStateFunction: () {},
    ).responseFunction(null);
  }
}
