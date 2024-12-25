import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Dashboard card
class DashboardCard extends StatelessWidget {
  /// [DashboardCard] constructor
  const DashboardCard({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
    this.backgroundColor = whiteColor,
    this.iconColor = primaryColor,
    this.showArrow = false,
  });

  /// icon required
  final IconData icon;

  /// label required
  final String label;

  /// value required
  final String value;

  /// icon color
  final Color iconColor;

  /// background color
  final Color backgroundColor;

  /// show arrow toggle
  final bool showArrow;

  @override
  Widget build(BuildContext context) => Container(
        height: 80,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            const Spacer(),
            Row(
              children: <Widget>[
                Icon(icon, color: iconColor, size: 30),
                width5,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      label,
                      style: whiteColorInter14600,
                      softWrap: true, // Ensures the text wraps
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: iconColor.withOpacity(0.1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: Text(
                            value,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: iconColor,
                            ),
                          ),
                        ),
                        // if (showArrow) ...<Widget>[
                        //   const SizedBox(width: 8),
                        //   Icon(
                        //     value.contains("↑")
                        //         ? Icons.arrow_upward
                        //         : Icons.arrow_downward,
                        //     color: value.contains("↑")
                        //         ? Colors.green
                        //         : Colors.red,
                        //     size: 16,
                        //   ),
                        // ],
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<IconData>('icon', icon))
      ..add(StringProperty('label', label))
      ..add(StringProperty('value', value))
      ..add(ColorProperty('iconColor', iconColor))
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(DiagnosticsProperty<bool>('showArrow', showArrow));
  }
}
