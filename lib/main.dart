import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syntax_app/helper/shared_preferences.dart';
import 'package:syntax_app/screens/nav/nav_screen.dart';
import 'package:syntax_app/screens/onboarding/onboarding.dart';
import 'package:toastification/toastification.dart';

/// Initialized shared preferences
late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Shared preference instance declared and used through out the app
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

/// App screen
class MyApp extends StatefulWidget {
  /// [MyApp] constructor
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) => ToastificationWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: isLoggedIn()
              ? const NavigationScreen()
              : const OnboardingScreen(),
        ),
      );
}
