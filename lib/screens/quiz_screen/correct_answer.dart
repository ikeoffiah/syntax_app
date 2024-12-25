import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syntax_app/models/courses/courses_model.dart';
import 'package:syntax_app/screens/congratulations/continue.dart';

import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/screens/quiz_screen/quiz_screen2.dart';

import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Correct answer widget
class CorrectAnswerWidget extends StatelessWidget {
  /// [CorrectAnswerWidget] constructor
  const CorrectAnswerWidget({
    required this.explanation,
    required this.allQuestions,
    required this.currentIndex,
    required this.answerChosen,
    super.key,
  });

  /// explanation of the answer
  final String explanation;

  /// all current questions
  final List<QuestionModel> allQuestions;

  /// current Index
  final int currentIndex;

  /// answer chosen

  final List<Map<String, dynamic>> answerChosen;

  @override
  Widget build(BuildContext context) => Container(
        padding: pageMargin,
        child: Column(
          children: <Widget>[
            height16,
            Row(
              children: <Widget>[
                Container(
                  height: 32,
                  width: 32,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      color: whiteColor,
                    ),
                  ),
                ),
                width8,
                Text(
                  "Correct answer",
                  style: greenColorInter18700,
                ),
              ],
            ),
            const Spacer(),
            height16,
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: Colors.green),
              ),
              child: Text(
                explanation,
                style: whiteColorInter14600,
              ),
            ),
            height16,
            const Spacer(),
            CustomButton(
              color: Colors.green,
              buttonStyle: whiteColorInter12600,
              callback: () async {
                Navigator.pop(context);
                if (currentIndex < allQuestions.length - 1) {
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => QuizScreen2(
                        allQuestions: allQuestions,
                        currentIndex: currentIndex + 1,
                        chosenOptions: answerChosen,
                      ),
                    ),
                  );
                } else {
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          ContinueScreen(submissions: answerChosen),
                    ),
                  );
                }
              },
              buttonText: "Continue",
            ),
            height20,
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('explanation', explanation))
      ..add(IterableProperty<QuestionModel>('allQuestions', allQuestions))
      ..add(IntProperty('currentIndex', currentIndex))
      ..add(
        IterableProperty<Map<String, dynamic>>('answerChosen', answerChosen),
      );
  }
}
