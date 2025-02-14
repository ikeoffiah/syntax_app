import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:syntax_app/helper/constants.dart';
import 'package:syntax_app/helper/upload_pdf.dart';
import 'package:syntax_app/screens/custom_widget/appbar/app_bar.dart';
import 'package:syntax_app/screens/custom_widget/custom_buttons/custom_button.dart';
import 'package:syntax_app/screens/custom_widget/custom_input_field/custom_input_field.dart';
import 'package:syntax_app/screens/extra/loading.dart';
import 'package:syntax_app/screens/nav/nav_screen.dart';
import 'package:syntax_app/screens/utils/colors.dart';
import 'package:syntax_app/screens/utils/margins.dart';
import 'package:syntax_app/screens/utils/size.dart';
import 'package:syntax_app/screens/utils/text_style.dart';
import 'package:syntax_app/view_model/courses_view_model/create_project_view_model.dart';

/// Add custom questions
class AddCustomQuestions extends StatefulWidget {
  /// constructor
  const AddCustomQuestions({super.key});

  @override
  State<AddCustomQuestions> createState() => _AddCustomQuestionsState();
}

class _AddCustomQuestionsState extends State<AddCustomQuestions> {
  final TextEditingController _nameController = TextEditingController();
  bool hasAddedName = false;
  bool buttonCick = false;
  @override
  Widget build(BuildContext context) => buttonCick
      ? const LoadingScreen(title: "Creating project, this might take long ..")
      : Scaffold(
          appBar: const RegularAppBar(),
          backgroundColor: primaryColor,
          body: Center(
            child: Container(
              margin: pageMargin,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                children: <Widget>[
                  if (!hasAddedName)
                    Column(
                      children: <Widget>[
                        Text(
                          "Create flashcard",
                          style: whiteColorInter20600,
                        ),
                        height40,
                        CustomInputField(
                          placeholder: "Enter name of project",
                          title: "Project name",
                          controller: _nameController,
                          onChangeValue: (String value) {},
                        ),
                        height40,
                        CustomButton(
                          color: whiteColor,
                          buttonStyle: primaryColorInter16600,
                          callback: () async {
                            setState(() {
                              hasAddedName = true;
                            });
                          },
                          buttonText: "Continue",
                        ),
                      ],
                    )
                  else
                    Column(
                      children: <Widget>[
                        Text(
                          "Upload document",
                          style: whiteColorInter20600,
                        ),
                        height20,
                        Lottie.asset(
                          pdfJSON,
                          repeat: true,
                        ),
                        height20,
                        CustomButton(
                          color: whiteColor,
                          buttonStyle: primaryColorInter16600,
                          callback: () async {
                            setState(() {
                              buttonCick = true;
                            });
                            final String? pdf = await uploadPdf();
                            log(pdf!);
                            await CreateProjectViewModel(
                                onChangeValue: (bool value) {
                              setState(() {
                                buttonCick = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const NavigationScreen(),
                                ),
                              );
                            }).submitProject(
                                topic: _nameController.text.trim(), url: pdf);
                          },
                          buttonText: "Upload PDF",
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('hasAddedName', hasAddedName))
      ..add(DiagnosticsProperty<bool>('buttonCick', buttonCick));
  }
}
