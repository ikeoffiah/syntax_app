import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/main.dart';
import 'package:syntax_app/models/user/user_model.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/screens/dashboard/dashboard_card.dart';
import 'package:syntax_app/screens/extra/loading.dart';
import 'package:syntax_app/screens/onboarding/google_auth.dart';
import 'package:syntax_app/screens/onboarding/onboarding.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';
import 'package:syntax_app/view_model/user_view_model/fetch_user_view_model.dart';

/// Dashboard screen
class Dashboard extends StatefulWidget {
  /// [Dashboard] constructor
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final int streak = 10;
  final int points = 450; // Current points
  final int lastPoints = 400; // Last recorded points
  final int questionsAttempted = 120;
  bool _isLoading = true;
  UserData? userInfo;
  int totalValue = 0;

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

        final List<PieChartSectionData> itemData = <PieChartSectionData>[];
        int index = 0;
        int total = 0;

        data.categoryPoints.forEach((String key, value) {
          itemData.add(
            PieChartSectionData(
              value: value * 1.0,
              color: dashColor[index % 5],
              title: '$key($value)',
              radius: 50,
              titleStyle: whiteColorInter8600,
            ),
          );
          index++;
          total = total + (value as int);
        });
        sortItemsByHighestValue(itemData);

        setState(() {
          pieData = itemData;
          totalValue = total;
        });
      },
    ).getUserProfile();
  }

  void sortItemsByHighestValue(List<PieChartSectionData> items) {
    items.sort(
      (PieChartSectionData a, PieChartSectionData b) =>
          b.value.compareTo(a.value),
    );
  }

  List<PieChartSectionData> pieData = <PieChartSectionData>[];

  // FetchUserViewModel

  @override
  Widget build(BuildContext context) => _isLoading
      ? const LoadingScreen(title: "Getting your data...")
      : Scaffold(
          backgroundColor: primaryColor,
          // appBar: const RegularAppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: pageMargin,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    height20,
                    // Topics Performance (Pie Chart)
                    Text(
                      "Topics Performance",
                      style: whiteColorInter20600,
                    ),
                    height16,
                    // Center(
                    //   child: SizedBox(
                    //     height: 250,
                    //     child: PieChart(
                    //       PieChartData(
                    //         sections: pieData,
                    //         centerSpaceRadius: 50,
                    //         borderData: FlBorderData(show: false),
                    //         sectionsSpace: 3,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    if (pieData.isEmpty)
                      Container()
                    else
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Column(
                          children: pieData
                              .map(
                                (PieChartSectionData item) => Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          item.title,
                                          style: primaryColorInter10600,
                                        ),
                                      ),
                                      Stack(
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: greyColor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: item.value > 0
                                                ? (MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5) *
                                                    (item.value / totalValue)
                                                : 0,
                                            height: 8,
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                        child: Text(
                                          '${item.value}',
                                          style: primaryColorInter10600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),

                    // const MultiColorBarChart()
                    const SizedBox(height: 32),

                    // Streak and Points
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // Streak
                          Expanded(
                            child: DashboardCard(
                              icon: Icons.local_fire_department,
                              label: userInfo!.stage,
                              value: "Keep it up!",
                              iconColor: Colors.red,
                            ),
                          ),
                          // const MultiColorBarChart(),
                          width8,
                          // Points
                          Expanded(
                            child: DashboardCard(
                              icon: Icons.star,
                              label: "${userInfo!.points} Points",
                              value: 'Your points',
                              iconColor: Colors.green,
                              showArrow: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Number of Questions Attempted
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: DashboardCard(
                        iconColor: Colors.orange,
                        icon: Icons.question_answer,
                        label: "Questions Attempted",
                        value: "${userInfo!.totalAttempts} questions",
                      ),
                    ),

                    height20,

                    CustomButton(
                      color: whiteColor,
                      buttonStyle: primaryColorRoboto16600,
                      callback: () {
                        final AuthService authService = AuthService();
                        unawaited(sharedPreferences.clear());
                        unawaited(authService.signOut());
                        unawaited(
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const OnboardingScreen(),
                            ),
                            (Route<dynamic> route) =>
                                false, // Removes all previous routes
                          ),
                        );
                      },
                      buttonText: "Log out",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

  // Helper widget to build card with icon and text

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IntProperty('streak', streak))
      ..add(IntProperty('points', points))
      ..add(IntProperty('lastPoints', lastPoints))
      ..add(IntProperty('questionsAttempted', questionsAttempted))
      ..add(IterableProperty<PieChartSectionData>('pieData', pieData))
      ..add(DiagnosticsProperty<UserData?>('userInfo', userInfo))
      ..add(IntProperty('totalValue', totalValue));
  }
}
