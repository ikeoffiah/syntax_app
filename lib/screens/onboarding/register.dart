import 'package:flutter/material.dart';
import 'package:syntax_app/helper/toasts.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/screens/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:syntax_app/screens/onboarding/register2.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';

/// Onboarding Screen
class RegisterScreen extends StatefulWidget {
  /// [RegisterScreen] constructor
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: primaryColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  height100,
                  Container(
                    margin: pageMargin,
                    width: MediaQuery.sizeOf(context).width,
                    child: Text(
                      "Register",
                      style: whiteColorInter25700,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  height50,

                  // Container(
                  //   alignment: Alignment.center,
                  //   child: SizedBox(
                  //     width: 120,
                  //     height: 120,
                  //     child: ClipRRect(
                  //       borderRadius:
                  //           const BorderRadius.all(Radius.circular(60)),
                  //       child: Image.asset(
                  //         width: 120,
                  //         height: 120,
                  //         logoImg,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // height50,
                  CustomInputField(
                    placeholder: "Enter your name..",
                    title: "First Name",
                    controller: _firstNameController,
                    onChangeValue: (String value) {},
                  ),
                  height16,
                  CustomInputField(
                    placeholder: "Enter your name..",
                    title: "Last Name",
                    controller: _lastNameController,
                    onChangeValue: (String value) {},
                  ),
                  height16,
                  const Spacer(),
                  Container(
                    margin: pageMargin,
                    child: CustomButton(
                      color: whiteColor,
                      buttonStyle: primaryColorFira16600,
                      callback: () async {
                        if (_firstNameController.text.trim().isNotEmpty &&
                            _lastNameController.text.trim().isNotEmpty) {
                          await Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  RegisterScreen2(
                                firstName: _firstNameController.text.trim(),
                                lastName: _lastNameController.text.trim(),
                              ),
                            ),
                          );
                        } else {
                          if (_firstNameController.text.trim().isEmpty) {
                            infoToast("Please input your first name");
                          }

                          if (_lastNameController.text.trim().isEmpty) {
                            infoToast("Please input your last name");
                          }
                        }
                      },
                      buttonText: "Continue",
                    ),
                  ),
                  height20,
                ],
              ),
            ),
          ],
        ),
      );
}
