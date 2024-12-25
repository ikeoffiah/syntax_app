import "package:flutter/material.dart";
import "package:syntax_app/screens/utils/colors.dart";

/// Custom bottom sheet
void callBottomSheetInstance({
  required BuildContext context,
  required Widget widget,
  required double height,
  bool isDismissible = false,
  bool enableDrag = false,
}) {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await showModalBottomSheet(
      isDismissible: isDismissible,
      isScrollControlled: true,
      enableDrag: enableDrag,
      context: context,
      builder: (BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * height,
        decoration: const BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: widget,
      ),
    );
  });
}
