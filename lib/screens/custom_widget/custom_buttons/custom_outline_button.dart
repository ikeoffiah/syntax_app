import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syntax_app/screens/utils/colors.dart';

/// A custom outlined button widget.
class CustomOutlinedButton extends StatelessWidget {
  /// Creates a [CustomOutlinedButton].
  ///
  /// The [color], [buttonStyle], [callback], and [buttonText] must not be null.
  const CustomOutlinedButton({
    required this.color,
    required this.buttonStyle,
    required this.callback,
    required this.buttonText,
    super.key,
    this.outlineColor = primaryColor,
    this.outlineWidth = 2,
    this.height = 48,
    this.curve = 6.0,
    this.width,
    this.isLoading = false,
  });

  /// The color of the button.
  final Color color;

  /// The text of the button.
  final String buttonText;

  /// The callback of the button.
  final VoidCallback callback;

  /// The style of the button.
  final TextStyle buttonStyle;

  /// The height of the button.
  final double height;

  /// The curve of the button.
  final double curve;

  /// The width of the button.
  final double? width;

  /// The loading state of the button.
  final bool isLoading;

  /// The color of the outline.
  final Color outlineColor;

  /// The width of the outline.
  final double outlineWidth;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width ?? MediaQuery.of(context).size.width,
        child: OutlinedButton(
            onPressed: isLoading ? null : callback,
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: outlineColor, width: outlineWidth),
                backgroundColor: color,
                minimumSize: Size(327, height),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(curve))),
            child: Text(
              isLoading ? "UPLOADING....." : buttonText,
              style: buttonStyle,
            )),
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
      ..add(ColorProperty('outlineColor', outlineColor))
      ..add(DoubleProperty('outlineWidth', outlineWidth));
  }
}
