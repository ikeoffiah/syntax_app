import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/helper/shared_preferences.dart';
import 'package:syntax_app/models/courses/courses_model.dart';
import 'package:syntax_app/models/user/user_model.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/screens/extra/loading.dart';
import 'package:syntax_app/screens/quiz_screen/quiz_screen2.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';
import 'package:syntax_app/view_model/courses_view_model/courses_view_model.dart';
import 'package:syntax_app/view_model/user_view_model/fetch_user_view_model.dart';

/// Home page
class HomepageScreen extends StatefulWidget {
  /// Home page constructor
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  String firstName = getFirstName();
  bool _isLoading = true;
  UserData? userInfo;
  String _loadingString = "Fetching your details ...";

  @override
  void initState() {
    super.initState();
    unawaited(_getProfile());
  }

  Future<void> _getProfile() async {
    await FetchUserViewModel(
      onChangeValue: (bool isSuccess) {
        setState(() {
          _isLoading = false;
        });
      },
      getData: (UserData data) {
        setState(() {
          userInfo = data;
        });
      },
    ).getUserProfile();
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
        Navigator.push(
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
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  height30,
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Text(
                      'Hi $firstName 😊',
                      style: whiteColorInter20600,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  height24,
                  Card(
                    color: Colors.orange.shade700,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.local_fire_department,
                                color: Colors.white,
                                size: 28,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '${userInfo!.totalAttempts} attempts',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Test your skills everyday to maintain your streak',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            color: primaryColor,
                            buttonStyle: whiteColorInter14600,
                            callback: _fetchQuestions,
                            buttonText: "START A LESSON",
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.blue.shade800,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                child: Text(
                                  '${userInfo?.stage.toUpperCase()}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                '1 day',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Take more tests to improve your skills exponentially and attain GURU status',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          Lottie.asset(
                            studyJSON,
                            repeat: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('firstName', firstName))
      ..add(DiagnosticsProperty<UserData>('userInfo', userInfo));
  }
}
