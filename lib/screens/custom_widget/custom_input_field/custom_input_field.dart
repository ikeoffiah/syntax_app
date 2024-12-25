import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Custom input field
class CustomInputField extends StatelessWidget {
  /// constructor
  const CustomInputField({
    required this.placeholder,
    required this.title,
    required this.controller,
    required this.onChangeValue,
    super.key,
    this.validation = false,
    this.password = false,
    this.isForgetPassword = false,
    this.isEmail = true,
    this.onPress,
    this.focusNode,
    this.passwordVisible = false,
    this.noSpecialCharacter = false,
    this.height = 45,
    this.isOptional = false,
  });

  /// placeholder of the custom input field
  final String placeholder;

  /// check if field contains password
  final bool password;

  /// height of the field
  final double height;

  /// if field is clickable use onPress
  final VoidCallback? onPress;

  /// Input field validation
  final bool validation;

  /// Input field text controller
  final TextEditingController controller;

  /// toggle to make password visible if it is a password field
  final bool passwordVisible;

  /// The title of the field
  final String title;

  /// Listening to change in value of the input field
  final dynamic Function(String) onChangeValue;

  /// bool to check if to show "forget password" hyperlink
  final bool isForgetPassword;

  /// bool to check if this is an email
  final bool isEmail;

  /// prevent special characters from being inputted
  final bool noSpecialCharacter;

  /// focus Node for the input field
  final FocusNode? focusNode;

  /// toggle to insert optional text to the title
  final bool isOptional;

  @override
  Widget build(BuildContext context) => Container(
        margin: pageMargin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: whiteColorInter14600,
            ),
            height16,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: height,
                  child: TextField(
                    inputFormatters: noSpecialCharacter
                        ? <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp("[0-9a-zA-Z]"),
                            ),
                          ]
                        : null,
                    style: whiteColorInter14600,
                    controller: controller,
                    obscureText: passwordVisible,
                    focusNode: focusNode,
                    onChanged: onChangeValue.call,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      hintText: placeholder,
                      suffixIcon: password
                          ? IconButton(
                              onPressed: onPress,
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: whiteColor,
                              ),
                            )
                          : null,
                      hintStyle: whiteColorInter14600,
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: redColor),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: whiteColor, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: validation ? redColor : whiteColor,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                ),
                if (validation)
                  const SizedBox(
                    height: 5,
                  )
                else
                  Container(),
                if (validation)
                  Text(
                    "$title Field should not be empty",
                    style: redColorInter50012,
                    textAlign: TextAlign.start,
                  )
                else
                  Container(),
                if (isForgetPassword)
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () {
                        // await Navigator.push(
                        //   context,
                        //   MaterialPageRoute<void>(
                        //     builder: (BuildContext context) => isEmail
                        //         ? const ForgotPasswordEmail()
                        //         : const ForgotPasswordPhone(),
                        //   ),
                        // );
                      },
                      child: Text(
                        "Forgot Password?",
                        textAlign: TextAlign.end,
                        style: highlightColorInter50012,
                      ),
                    ),
                  )
                else
                  Container(),
              ],
            ),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('placeholder', placeholder))
      ..add(DiagnosticsProperty<bool>('password', password))
      ..add(DoubleProperty('height', height))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onPress', onPress))
      ..add(DiagnosticsProperty<bool>('validation', validation))
      ..add(
        DiagnosticsProperty<TextEditingController>('controller', controller),
      )
      ..add(DiagnosticsProperty<bool>('passwordVisible', passwordVisible))
      ..add(StringProperty('title', title))
      ..add(
        ObjectFlagProperty<Function(String p1)>.has(
          'onChangeValue',
          onChangeValue,
        ),
      )
      ..add(DiagnosticsProperty<bool>('isForgetPassword', isForgetPassword))
      ..add(DiagnosticsProperty<bool>('isEmail', isEmail))
      ..add(DiagnosticsProperty<bool>('noSpecialCharacter', noSpecialCharacter))
      ..add(DiagnosticsProperty<FocusNode?>('focusNode', focusNode))
      ..add(DiagnosticsProperty<bool>('isOptional', isOptional));
  }
}
