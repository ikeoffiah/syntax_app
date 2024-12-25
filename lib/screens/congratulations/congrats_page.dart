import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Congratulation Page
class CongratulationsPage extends StatefulWidget {
  /// [CongratulationsPage] constructor
  const CongratulationsPage({required this.finalScore, super.key});

  ///
  final int finalScore;

  @override
  State<CongratulationsPage> createState() => _CongratulationsPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('finalScore', finalScore));
  }
}

class _CongratulationsPageState extends State<CongratulationsPage> {
  // Example final score
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: <Widget>[
            // Gradient Background
            Container(
              decoration: BoxDecoration(color: primaryColor
                  // gradient: LinearGradient(
                  //   colors: <Color>[
                  //     primaryColor.withOpacity(0.9),
                  //     primaryColor.withOpacity(0.6),
                  //   ],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  // ),
                  ),
            ),

            // Main Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Celebration Text
                  Text(
                    "🎉 Congratulations! 🎉",
                    style: whiteColorInter25700,
                    textAlign: TextAlign.center,
                  ),
                  height20,

                  // Final Score
                  Text(
                    "Your Final Score: ${widget.finalScore}",
                    style: whiteColorFira20600,
                  ),
                  height40,

                  // Animated Emojis (Lottie)
                  SizedBox(
                    height: 150,
                    child: Lottie.asset(
                      celebrationJSON,
                      repeat: true,
                    ),
                  ),
                  height30,

                  // Continue Button
                  Container(
                    margin: pageMargin,
                    child: CustomButton(
                      color: whiteColor,
                      buttonStyle: primaryColorFira16600,
                      callback: () {},
                      buttonText: "Continue",
                    ),
                  ),
                ],
              ),
            ),

            // Ribbons (Optional: Use Positioned for different locations)
            Positioned(
              top: 50,
              left: 20,
              child: Icon(
                Icons.celebration,
                color: Colors.white.withOpacity(0.8),
                size: 50,
              ),
            ),
            Positioned(
              bottom: 50,
              right: 20,
              child: Icon(
                Icons.celebration,
                color: Colors.white.withOpacity(0.8),
                size: 50,
              ),
            ),
          ],
        ),
      );
}
