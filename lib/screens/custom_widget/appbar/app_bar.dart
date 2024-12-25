import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syntax_app/screens/utils/boxshadow.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';

/// A custom app bar with a back button.
class RegularAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a [RegularAppBar].
  ///
  /// If [popPage] is true, tapping the back button will pop the current page.
  /// If false, it will push [widget] as a replacement.
  const RegularAppBar({super.key, this.popPage = true, this.widget});

  /// Whether to pop the current page when the back button is tapped.
  final bool popPage;

  /// The widget to push as a replacement when [popPage] is false.
  final Widget? widget;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: const BoxDecoration(color: whiteColor),
        child: AppBar(
          backgroundColor: whiteColor,
          centerTitle: true,
          elevation: 0,
          flexibleSpace: ColoredBox(
            color: whiteColor,
            child: SafeArea(
              child: Container(
                margin: pageMargin,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 36,
                      width: 36,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        boxShadow: <BoxShadow>[customBoxShadow],
                        border: Border.all(color: appBarStroke),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: primaryColor,
                            size: 16,
                          ),
                          onPressed: () async {
                            if (popPage) {
                              if (Navigator.canPop(context)) {
                                Navigator.pop(context);
                              } else {
                                await SystemNavigator.pop();
                              }
                            } else {
                              await Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) => widget!,
                                ),
                              );
                            }
                          },
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          ),
          leading: Container(
            width: 0,
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('popPage', popPage));
  }
}
