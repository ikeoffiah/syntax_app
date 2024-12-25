import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Bottom Section screen
class BottomSection extends StatelessWidget {
  /// [BottomSection] constructor
  const BottomSection({
    required this.callback,
    required this.difficulty,
    super.key,
  });

  /// callback
  final VoidCallback callback;

  /// difficulty
  final String difficulty;
  @override
  Widget build(BuildContext context) => Container(
        color: primaryColor,
        width: MediaQuery.sizeOf(context).width,
        padding: pageMargin,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Python\nDifficulty: $difficulty',
              style: const TextStyle(color: Colors.white),
            ),
            CustomButton(
              hasWidth: true,
              width: 100,
              color: Colors.green,
              buttonStyle: whiteColorInter12600,
              callback: callback,
              buttonText: "CHECK",
            ),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.blue,
            //     shape: const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(8)),
            //     ),
            //   ),
            //   onPressed: () {
            //     // Handle submit
            //   },
            //   child: const Text('SUBMIT'),
            // ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback>.has('callback', callback))
      ..add(StringProperty('difficulty', difficulty));
  }
}
