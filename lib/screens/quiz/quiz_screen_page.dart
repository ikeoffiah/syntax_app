import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai.dart';
import 'package:syntax_app/screens/custom_widget/appbar/app_bar.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/screens/quiz/options.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Quiz Screen page
class QuizScreenPage extends StatefulWidget {
  /// [QuizScreenPage] constructor
  const QuizScreenPage({required this.currentPage, super.key});

  /// current page
  final int currentPage;

  @override
  State<QuizScreenPage> createState() => _QuizScreenPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('currentPage', currentPage));
  }
}

class _QuizScreenPageState extends State<QuizScreenPage> {
  int _activeIndex = -1;
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Function to play audio
  Future<void> _playAudio() async {
    await _audioPlayer.play(AssetSource(correctAud));
  }

  @override
  void dispose() {
    super.dispose();
    unawaited(_audioPlayer.dispose()); // Dispose the player
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: whiteColor,
        appBar: const RegularAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Circular progress with a timer
              LinearProgressIndicator(
                color: teal,
                backgroundColor: greyColor,
                minHeight: 10,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                value: (widget.currentPage + 1) / 10,
              ),
              height24,
              // Question text

              // Options list
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Center(
                      child: HighlightView(
                        '''
try:  
    raise ValueError("An error occurred")  
except KeyError:  
    print("KeyError handled")  
except ValueError as e:  
    print(e)
''',
                        language: 'python',
                        theme: monokaiTheme,
                        padding: const EdgeInsets.all(16),
                        textStyle: whiteColorRoboto16600,
                      ),
                    ),
                    height24,
                    AnswerOptionWidget(
                      label: "1986",
                      isSelected: _activeIndex == 0,
                      onSelect: () {
                        setState(() {
                          _activeIndex = 0;
                        });
                      },
                    ),
                    AnswerOptionWidget(
                      label: "1994",
                      isSelected: _activeIndex == 1,
                      onSelect: () {
                        setState(() {
                          _activeIndex = 1;
                        });
                      },
                    ),
                    AnswerOptionWidget(
                      label: "2002",
                      isSelected: _activeIndex == 2,
                      onSelect: () {
                        setState(() {
                          _activeIndex = 2;
                        });
                      },
                    ),
                    AnswerOptionWidget(
                      label: "2010",
                      isSelected: _activeIndex == 3,
                      onSelect: () {
                        setState(() {
                          _activeIndex = 3;
                        });
                      },
                    ),
                    height24,
                    Center(
                      child: CustomButton(
                        color: primaryColor,
                        buttonStyle: whiteColorFira16600,
                        callback: () {
                          _playAudio();
                          // await Navigator.push(
                          //   context,
                          //   MaterialPageRoute<void>(
                          //     builder: (BuildContext context) => QuizScreenPage(
                          //       currentPage: widget.currentPage + 1,
                          //     ),
                          //   ),
                          // );
                        },
                        buttonText: "Next",
                      ),
                    ),
                    height16,
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
