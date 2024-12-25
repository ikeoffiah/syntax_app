import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai.dart';
import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/helper/custom_bottom_sheet.dart';
import 'package:syntax_app/models/courses/courses_model.dart';
import 'package:syntax_app/screens/quiz_screen/bottom_screen.dart';
import 'package:syntax_app/screens/quiz_screen/correct_answer.dart';
import 'package:syntax_app/screens/quiz_screen/quiz_option_widget.dart';
import 'package:syntax_app/screens/quiz_screen/wrong_answer.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Quiz screen
class QuizScreen2 extends StatefulWidget {
  /// [QuizScreen2] constructor
  const QuizScreen2({
    required this.allQuestions,
    required this.currentIndex,
    required this.chosenOptions,
    super.key,
  });

  /// all current questions
  final List<QuestionModel> allQuestions;

  /// current Index
  final int currentIndex;

  /// final chosen options
  final List<Map<String, dynamic>> chosenOptions;

  @override
  State<QuizScreen2> createState() => _QuizScreen2State();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<QuestionModel>('allQuestions', allQuestions))
      ..add(IntProperty('currentIndex', currentIndex))
      ..add(
        IterableProperty<Map<String, dynamic>>(
          'chosenOptions',
          chosenOptions,
        ),
      );
  }
}

class _QuizScreen2State extends State<QuizScreen2> {
  int selectedOption = -1;
  int timeRemaining = 23;
  late List<OptionModel> options;
  late OptionModel correctOptions;
  late List<Map<String, dynamic>> answerChosen;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    unawaited(_shuffleOptions());
  }

  Future<void>? _shuffleOptions() {
    setState(() {
      options = widget.allQuestions[widget.currentIndex].options;
      options.shuffle();
    });

    for (final OptionModel option in options) {
      if (option.isCorrect) {
        setState(() {
          correctOptions = option;
        });
      }
    }

    return null;
  }

  // Function to play audio
  Future<void> _playAudio() async {
    await _audioPlayer.play(AssetSource(correctAud));
  }

  Future<void> _playWrongAnswerAudio() async {
    await _audioPlayer.play(AssetSource(wrongAud));
  }

  void _popBottomSheet({
    required String explanation,
    String? correctAnswer,
    String? correctExplanation,
  }) {
    // custom
    callBottomSheetInstance(
      context: context,
      enableDrag: true,
      widget: correctAnswer != null
          ? WrongAnswerWidget(
              explanation: explanation,
              correctAnswer: correctAnswer,
              correctExplanation: correctExplanation!,
              allQuestions: widget.allQuestions,
              currentIndex: widget.currentIndex,
              answerChosen: answerChosen,
            )
          : CorrectAnswerWidget(
              explanation: explanation,
              allQuestions: widget.allQuestions,
              currentIndex: widget.currentIndex,
              answerChosen: answerChosen,
            ),
      height: correctAnswer != null ? 0.8 : 0.5,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.allQuestions[widget.currentIndex].category
                                .name,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          height10,
                          Text(
                            widget.allQuestions[widget.currentIndex].text,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          height16,
                          if (widget.allQuestions[widget.currentIndex].hasCode)
                            HighlightView(
                              widget.allQuestions[widget.currentIndex]
                                  .codeSnippet!,
                              language: 'python',
                              theme: monokaiTheme,
                              padding: const EdgeInsets.all(10),
                              textStyle: whiteColorRoboto14600,
                            )
                          else
                            Container(),
                        ],
                      ),
                    ),
                    height20,
                    SizedBox(
                      height: 750,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: <Widget>[
                          Text(
                            "Options",
                            style: whiteColorInter16600,
                          ),
                          height16,
                          QuizOptionWidget(
                            option: options[0].text,
                            isSelected: selectedOption == 0,
                            onTap: () {
                              setState(() {
                                selectedOption = 0;
                              });
                            },
                          ),
                          QuizOptionWidget(
                            option: options[1].text,
                            isSelected: selectedOption == 1,
                            onTap: () {
                              setState(() {
                                selectedOption = 1;
                              });
                            },
                          ),
                          QuizOptionWidget(
                            option: options[2].text,
                            isSelected: selectedOption == 2,
                            onTap: () {
                              setState(() {
                                selectedOption = 2;
                              });
                            },
                          ),
                          QuizOptionWidget(
                            option: options[3].text,
                            isSelected: selectedOption == 3,
                            onTap: () {
                              setState(() {
                                selectedOption = 3;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: BottomSection(
                difficulty: widget.allQuestions[widget.currentIndex].difficulty,
                callback: () async {
                  if (selectedOption != -1) {
                    final Map<String, dynamic> answers = <String, dynamic>{
                      "question_id":
                          widget.allQuestions[widget.currentIndex].id,
                      "selected_option_id": options[selectedOption].id,
                    };

                    if (!widget.chosenOptions.contains(answers)) {
                      final List<Map<String, dynamic>> item =
                          <Map<String, dynamic>>[...widget.chosenOptions];

                      setState(() {
                        answerChosen = item..add(answers);
                      });
                    }
                  }
                  if (widget.currentIndex < widget.allQuestions.length) {
                    if (options[selectedOption].id == correctOptions.id) {
                      await _playAudio();
                      _popBottomSheet(
                        explanation: correctOptions.explanation,
                      );
                    } else {
                      await _playWrongAnswerAudio();

                      _popBottomSheet(
                        explanation: options[selectedOption].explanation,
                        correctAnswer: correctOptions.text,
                        correctExplanation: correctOptions.explanation,
                      );
                    }
                  } else {}
                },
              ),
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('selectedOption', selectedOption))
      ..add(IntProperty('timeRemaining', timeRemaining))
      ..add(IterableProperty<OptionModel>('options', options))
      ..add(
        DiagnosticsProperty<OptionModel>('correctOptions', correctOptions),
      )
      ..add(
        IterableProperty<Map<String, dynamic>>('answerChosen', answerChosen),
      );
  }
}



// class TimerWidget extends StatelessWidget {
//   final int timeRemaining;

//   const TimerWidget({required this.timeRemaining});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         const Icon(Icons.timer, color: Colors.red),
//         const SizedBox(width: 5),
//         Text(
//           '$timeRemaining seconds remaining',
//           style: const TextStyle(color: Colors.red, fontSize: 16),
//         ),
//       ],
//     );
//   }

//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(IntProperty('timeRemaining', timeRemaining));
//   }
// }
