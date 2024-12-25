import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syntax_app/helper/toasts.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/screens/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:syntax_app/screens/extra/loading.dart';
import 'package:syntax_app/screens/nav/nav_screen.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';
import 'package:syntax_app/view_model/auth_view_model/register_view_model.dart';

/// Onboarding Screen
class RegisterScreen2 extends StatefulWidget {
  /// [RegisterScreen2] constructor
  const RegisterScreen2({
    required this.firstName,
    required this.lastName,
    super.key,
  });

  /// first name
  final String firstName;

  /// last name
  final String lastName;

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('firstName', firstName))
      ..add(StringProperty('lastName', lastName));
  }
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) => isLoading
      ? const LoadingScreen(title: "Registering you ..")
      : Scaffold(
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
                    CustomInputField(
                      placeholder: "Enter your email..",
                      title: "Email",
                      controller: _emailController,
                      onChangeValue: (String value) {},
                    ),
                    height16,
                    CustomInputField(
                      password: true,
                      passwordVisible: isVisible,
                      onPress: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      placeholder: "Enter a password..",
                      title: "Password",
                      controller: _passwordController,
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
                          if (_emailController.text.trim().isNotEmpty &&
                              _passwordController.text.trim().isNotEmpty) {
                            setState(() {
                              isLoading = true;
                            });
                            await RegisterViewModel(
                              context: context,
                              onChangeValue: (bool isSuccess) {
                                setState(() {
                                  isLoading = false;
                                });
                                if (isSuccess) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const NavigationScreen(),
                                    ),
                                  );
                                }
                              },
                            ).registerIndividual(
                              firstName: widget.firstName,
                              lastName: widget.lastName,
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                          } else {
                            if (_emailController.text.trim().isEmpty) {
                              infoToast("Please input your email");
                            }

                            if (_passwordController.text.trim().isEmpty) {
                              infoToast("Please input your password");
                            }
                          }
                        },
                        buttonText: "Register",
                      ),
                    ),
                    height20,
                  ],
                ),
              ),
            ],
          ),
        );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isVisible', isVisible))
      ..add(DiagnosticsProperty<bool>('isLoading', isLoading));
  }
}
