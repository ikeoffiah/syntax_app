import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Bottom Icon
class BottomIcon extends StatefulWidget {
  /// [BottomIcon] constructor
  const BottomIcon({
    required this.index,
    required this.name,
    required this.callback,
    required this.selectedPage,
    required this.image,
    required this.activeImage,
    super.key,
  });

  /// callback
  final VoidCallback callback;

  /// selected Page
  final int selectedPage;

  /// name
  final String name;

  /// index
  final int index;

  ///  image
  final IconData image;

  /// active image
  final IconData activeImage;

  @override
  State<BottomIcon> createState() => _BottomIconState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback>.has('callback', callback))
      ..add(IntProperty('selectedPage', selectedPage))
      ..add(StringProperty('name', name))
      ..add(IntProperty('index', index))
      ..add(DiagnosticsProperty<IconData>('image', image));
    properties.add(DiagnosticsProperty<IconData>('activeImage', activeImage));
  }
}

class _BottomIconState extends State<BottomIcon> {
  /// selected page

  @override
  Widget build(BuildContext context) => InkWell(
        excludeFromSemantics: true,
        canRequestFocus: false,
        enableFeedback: false,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        onTap: widget.callback,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          height: 64,
          child: Container(
            width: 10,
            color: Colors.grey.withOpacity(0.2),
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Spacer(),
                    Center(
                      child: widget.selectedPage == widget.index
                          ? Icon(
                              widget.image,
                              color: whiteColor,
                            )
                          : Icon(
                              widget.activeImage,
                              color: whiteColor,
                            ),
                    ),
                    height7,
                    Center(
                      child: Text(
                        widget.name,
                        style: whiteColorInter12600,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Positioned(
                  child: SizedBox(
                    height: 10,
                    width: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
