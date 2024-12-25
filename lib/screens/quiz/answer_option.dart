import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syntax_app/screens/utils/size.dart';

/// Answer widget
class AnswerOptions extends StatefulWidget {
  /// [AnswerOptions] constructor
  const AnswerOptions({
    required this.answer,
    required this.index,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  /// answer
  final String answer;

  /// index
  final int index;

  /// check what was selected
  final bool isSelected;

  /// listens to tap
  final VoidCallback onTap;

  @override
  State<AnswerOptions> createState() => _AnswerOptionsState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('answer', answer))
      ..add(IntProperty('index', index))
      ..add(DiagnosticsProperty<bool>('isSelected', isSelected))
      ..add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
  }
}

class _AnswerOptionsState extends State<AnswerOptions> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: widget.isSelected,
              onChanged: (_) {
                widget.onTap();
              },
            ),
            width8,
            Text(widget.answer),
          ],
        ),
      );
}
