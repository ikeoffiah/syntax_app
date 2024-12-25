import 'package:flutter/material.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/screens/quiz/answer_option.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Quiz Page Screen
class QuizPageScreen extends StatefulWidget {
  /// [QuizPageScreen] constructor
  const QuizPageScreen({super.key});

  @override
  State<QuizPageScreen> createState() => _QuizPageScreenState();
}

class _QuizPageScreenState extends State<QuizPageScreen> {
  int _currentQuestion = 0;
  List<bool> _selectedAnswers = List.generate(4, (_) => false);

  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswers = List.generate(4, (int i) => i == index);
    });
  }

  void _previousQuestion() {
    setState(() {
      _currentQuestion--;
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LinearProgressIndicator(
                value: (_currentQuestion + 1) / 10,
              ),
              height16,
              Text(
                "In what year did the United States host the FIFA World Cup for the first time?",
                style: primaryColorFira18600,
              ),
              height16,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AnswerOptions(
                    answer: '1986',
                    index: 0,
                    isSelected: _selectedAnswers[0],
                    onTap: () => _selectAnswer(0),
                  ),
                  AnswerOptions(
                    answer: '1994',
                    index: 1,
                    isSelected: _selectedAnswers[1],
                    onTap: () => _selectAnswer(1),
                  ),
                  AnswerOptions(
                    answer: '2002',
                    index: 2,
                    isSelected: _selectedAnswers[2],
                    onTap: () => _selectAnswer(2),
                  ),
                  AnswerOptions(
                    answer: '2010',
                    index: 3,
                    isSelected: _selectedAnswers[3],
                    onTap: () => _selectAnswer(3),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: <Widget>[
                  CustomButton(
                    color: primaryColor,
                    buttonStyle: whiteColorFira16600,
                    callback: _currentQuestion > 0 ? _previousQuestion : () {},
                    buttonText: "Previous",
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
