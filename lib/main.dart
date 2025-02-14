import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:syntax_app/firebase_options.dart';
import 'package:syntax_app/helper/shared_preferences.dart';
import 'package:syntax_app/screens/nav/nav_screen.dart';
import 'package:syntax_app/screens/onboarding/onboarding.dart';
import 'package:toastification/toastification.dart';

/// Initialized shared preferences
late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Shared preference instance declared and used through out the app
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  sharedPreferences = await SharedPreferences.getInstance();
  await Supabase.initialize(
    url: 'https://kteytsqlfmolpdctazte.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt0ZXl0c3FsZm1vbHBkY3RhenRlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMzOTg1NjgsImV4cCI6MjA0ODk3NDU2OH0.pUL7v4RA3Yuzv-_B6wAeggy4Ugl4gnqld8z2Q7yg07g',
  );
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
