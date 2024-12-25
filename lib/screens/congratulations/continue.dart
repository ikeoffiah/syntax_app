import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/models/courses/courses_model.dart';
import 'package:syntax_app/models/user/user_results_model.dart';
import 'package:syntax_app/screens/congratulations/congrats_page.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/screens/extra/loading.dart';
import 'package:syntax_app/screens/quiz_screen/quiz_screen2.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';
import 'package:syntax_app/view_model/courses_view_model/courses_view_model.dart';
import 'package:syntax_app/view_model/courses_view_model/submit_test_view_model.dart';

/// Continue screen
class ContinueScreen extends StatefulWidget {
  /// [ContinueScreen] constructor
  const ContinueScreen({required this.submissions, super.key});

  /// submission
  final List<Map<String, dynamic>> submissions;

  @override
  State<ContinueScreen> createState() => _ContinueScreenState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      IterableProperty<Map<String, dynamic>>('submissions', submissions),
    );
  }
}

class _ContinueScreenState extends State<ContinueScreen> {
  bool _isLoading = true;
  int _points = 0;
  String _loadingString = "Retrieving your score ..";
  @override
  void initState() {
    super.initState();
    unawaited(_submitTest());
  }

  Future<void> _submitTest() async {
    await SubmitTestViewModel(
      onChangeValue: (bool isSuccess) {
        setState(() {
          _isLoading = false;
        });
      },
      getResults: (UserResultModel results) {
        setState(() {
          _points = results.data.points;
        });
        if (results.data.stageUpdated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => CongratulationsPage(
                finalScore: results.data.points,
              ),
            ),
          );
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      },
    ).submitResult(result: widget.submissions);
  }

  Future<void> _fetchQuestions() async {
    setState(() {
      _isLoading = true;
      _loadingString = "Fetching questions...";
    });
    await FetchQuestionsViewModel(
      onChangeValue: (bool isSuccess) {
        setState(() {
          _isLoading = false;
        });
        if (isSuccess) {}
      },
      getQuestion: (List<QuestionModel> quest) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => QuizScreen2(
              allQuestions: quest,
              currentIndex: 0,
              chosenOptions: const <Map<String, dynamic>>[],
            ),
          ),
        );
      },
    ).getQuestions();
  }

  @override
  Widget build(BuildContext context) => _isLoading
      ? LoadingScreen(title: _loadingString)
      : Scaffold(
          backgroundColor: primaryColor,
          body: SafeArea(
            child: Container(
              padding: pageMargin,
              child: Column(
                children: <Widget>[
                  height30,
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Text(
                      "You are almost there to the next stage",
                      style: whiteColorInter20600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  height16,
                  Text(
                    "Current points: $_points",
                    style: whiteColorFira16600,
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 300,
                    child: Lottie.asset(
                      continueJSON,
                      repeat: true,
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    color: whiteColor,
                    buttonStyle: primaryColorInter16600,
                    callback: _fetchQuestions,
                    buttonText: "Continue",
                  ),
                  height16,
                ],
              ),
            ),
          ),
        );
}
