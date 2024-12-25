import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Quiz option Widget
class QuizOptionWidget extends StatelessWidget {
  /// [QuizOptionWidget] constructor
  const QuizOptionWidget({
    required this.option,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  /// Options
  final String option;

  /// Is selected
  final bool isSelected;

  /// onTap
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.grey[800],
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Text(
            option,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('option', option))
      ..add(DiagnosticsProperty<bool>('isSelected', isSelected))
      ..add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
  }
}
