import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_outline_button.dart';
import 'package:syntax_app/screens/onboarding/login.dart';
import 'package:syntax_app/screens/onboarding/register.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Onboarding screen
class OnboardingScreen extends StatefulWidget {
  /// [OnboardingScreen] constructor
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    height20,
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                      child: ClipRect(
                        child: FittedBox(
                          fit: BoxFit.cover, // Choose a BoxFit option here
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: 300,
                            child: Lottie.asset(
                              codingJSON,
                              repeat: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                height30,
                Container(
                  margin: pageMargin,
                  alignment: Alignment.centerLeft,
                  child: SmoothPageIndicator(
                    controller: PageController(initialPage: activeIndex),
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: whiteColor,
                    ),
                    onDotClicked: (int index) {},
                  ),
                ),
                height16,
                CarouselSlider.builder(
                  itemCount: pageTitle.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) =>
                          Container(
                    margin: pageMargin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          pageTitle[index],
                          style: whiteColorInter20600,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          pageBody[index],
                          style: whiteColorInter14600,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  options: CarouselOptions(
                    height: 100,
                    viewportFraction: 1,
                    autoPlay: true,
                    onPageChanged:
                        (int index, CarouselPageChangedReason reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),
                height16,
                Container(
                  margin: pageMargin,
                  child: Column(
                    children: <Widget>[
                      CustomButton(
                        color: whiteColor,
                        buttonStyle: primaryColorInter16600,
                        callback: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const RegisterScreen(),
                            ),
                          );
                        },
                        buttonText: "Sign up",
                      ),
                      height16,
                      CustomOutlinedButton(
                        outlineColor: whiteColor,
                        outlineWidth: 1,
                        color: primaryColor,
                        buttonStyle: whiteColorInter16600,
                        callback: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const LoginInScreen(),
                            ),
                          );
                        },
                        buttonText: "Sign in",
                      ),
                      height10,
                    ],
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
    properties.add(IntProperty('activeIndex', activeIndex));
  }
}
