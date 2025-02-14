import 'package:flutter/material.dart';
import 'package:syntax_app/screens/utils/colors.dart';

/// loading
Future<void> loading(BuildContext context) async {
  await showDialog(
    barrierDismissible: false,
    useRootNavigator: false,
    context: context,
    builder: (BuildContext context) => Center(
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    ),
  );
}
