import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Loading screen
class LoadingScreen extends StatelessWidget {
  /// [LoadingScreen] screen
  const LoadingScreen({required this.title, super.key});

  /// title
  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: primaryColor,
        body: Container(
          padding: pageMargin,
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            children: <Widget>[
              const Spacer(),
              SizedBox(
                height: 300,
                child: Lottie.asset(
                  loadingJSON,
                  repeat: true,
                ),
              ),
              Text(
                title,
                style: whiteColorFira14600,
              ),
              const Spacer(),
            ],
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}
