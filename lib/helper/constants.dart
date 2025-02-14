//--------------------- IMG
import 'package:flutter/material.dart';

/// Syntax image
const String syntaxImg = "assets/images/Syntax.png";

/// splash image
const String splashImg = "assets/images/splash.png";

/// logo image
const String logoImg = "assets/images/logo.png";

// audio
/// correct audio
const String correctAud = "images/correct.mp3";

/// wrong audio
const String wrongAud = "audio/wrong.mp3";

// JSON
/// celebration
const String celebrationJSON = 'assets/images/celebration.json';

/// study
const String studyJSON = 'assets/images/a-sy.json';

/// continue
const String continueJSON = "assets/images/continue.json";

/// coding
const String codingJSON = "assets/images/coding.json";

/// loading
const String loadingJSON = "assets/images/loading.json";

/// pdf
const String pdfJSON = "assets/images/doc_pdf.json";

// onboarding text------------------

/// page title
const List<String> pageTitle = <String>[
  "Master Coding Interviews",
  "Conquer Data Structures",
  "Track Your Progress",
];

/// page body
const List<String> pageBody = <String>[
  "Learn from top interview questions and expert solutions to boost your confidence.",
  "Build a strong foundation with in-depth lessons and challenges on data structures.",
  "Set goals, practice daily, and monitor your growth with detailed analytics.",
];

//----------------URL

/// baseUrl
const String baseUrl = "https://syntax-api.vercel.app/api/v1";

///
/// dashboard color
List<Color> dashColor = <Color>[
  Colors.pink,
  Colors.blue,
  Colors.green,
  Colors.orange,
  Colors.cyan,
];

/// Enum
enum LastUploads { successful, uploading, failed, nothing }
