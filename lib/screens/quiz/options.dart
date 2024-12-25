import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syntax_app/screens/utils/colors.dart';

/// Answer Option widget
class AnswerOptionWidget extends StatefulWidget {
  /// [AnswerOptionWidget] constructor
  const AnswerOptionWidget({
    required this.label,
    required this.isSelected,
    required this.onSelect,
    super.key,
  });

  /// label
  final String label;

  /// check if it is selected
  final bool isSelected;

  /// on select callback
  final VoidCallback onSelect;

  @override
  State<AnswerOptionWidget> createState() => _AnswerOptionWidgetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', label))
      ..add(DiagnosticsProperty<bool>('isSelected', isSelected))
      ..add(ObjectFlagProperty<VoidCallback>.has('onSelect', onSelect));
  }
}

class _AnswerOptionWidgetState extends State<AnswerOptionWidget> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: widget.onSelect,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              side: BorderSide(
                color: widget.isSelected ? teal : Colors.grey[300]!,
              ),
            ),
            tileColor: widget.isSelected ? teal.withOpacity(0.2) : Colors.white,
            title: Text(
              widget.label,
              style: const TextStyle(fontSize: 16),
            ),
            leading: Radio<String>(
              value: widget.label,
              groupValue: widget.isSelected ? widget.label : null,
              onChanged: (String? value) {
                // Handle selection change
              },
              activeColor: teal,
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', widget.label))
      ..add(DiagnosticsProperty<bool>('isSelected', widget.isSelected))
      ..add(ObjectFlagProperty<VoidCallback>.has('onSelect', widget.onSelect));
  }
}
