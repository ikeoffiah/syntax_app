import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syntax_app/screens/utils/colors.dart';

/// A customizable button widget.
class CustomButton extends StatelessWidget {
  /// Creates a [CustomButton].
  ///
  /// The [color], [buttonStyle], [callback], and [buttonText] must not be null.
  const CustomButton({
    required this.color,
    required this.buttonStyle,
    required this.callback,
    required this.buttonText,
    super.key,
    this.isActive = true,
    this.height = 48,
    this.curve = 8.0,
    this.width = 327,
    this.disabledButtonColor =
        const Color(0xFFCCCCCC), // Using a constant color value
    this.hasWidth = false,
    this.isLoading = false,
  });

  /// The color of the button.
  final Color color;

  /// The text of the button.
  final String buttonText;

  /// The callback of the button.
  final VoidCallback callback;

  /// The disabled color of the button.
  final Color disabledButtonColor;

  /// The text style of the button.
  final TextStyle buttonStyle;

  /// The height of the button.
  final double height;

  /// The curve of the button.
  final double curve;

  /// The width of the button.
  final double width;

  /// The loading state of the button.
  final bool isLoading;

  /// The active state of the button.
  final bool isActive;

  /// The width state of the button.
  final bool hasWidth;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: hasWidth ? width : MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: isLoading || !isActive ? () {} : callback,
          style: ElevatedButton.styleFrom(
            backgroundColor: isLoading ? disabledButtonColor : color,
            minimumSize: Size(width, height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(curve),
            ),
          ),
          child: isLoading
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: whiteColor,
                )
              : Text(
                  buttonText,
                  style: buttonStyle,
                ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('color', color))
      ..add(StringProperty('buttonText', buttonText))
      ..add(ObjectFlagProperty<VoidCallback>.has('callback', callback))
      ..add(DiagnosticsProperty<TextStyle>('buttonStyle', buttonStyle))
      ..add(DoubleProperty('height', height))
      ..add(DoubleProperty('curve', curve))
      ..add(DoubleProperty('width', width))
      ..add(DiagnosticsProperty<bool>('isLoading', isLoading))
      ..add(DiagnosticsProperty<bool>('isActive', isActive))
      ..add(DiagnosticsProperty<bool>('hasWidth', hasWidth))
      ..add(ColorProperty('disabledButtonColor', disabledButtonColor));
  }
}
