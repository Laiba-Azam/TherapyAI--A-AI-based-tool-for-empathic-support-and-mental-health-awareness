import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Ensure Firebase is imported
import 'package:fypp/splash_screen.dart'; // Ensure this file exists
import 'package:fypp/key.dart'; // Ensure this file exists and has a valid API key
import 'package:fypp/home/home.dart'; // Correct path to Home widget
import 'package:fypp/login/login_form.dart'; // Correct path to LoginForm widget

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  // Gemini.init(apiKey: Gemini_Key); // Uncomment if Gemini is required and properly set up
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Show a loading spinner
          } else if (snapshot.hasData) {
            return Home(); // Show Home widget if user is logged in
          } else {
            return LoginForm(); // Show LoginForm widget if user is not logged in
          }
        },
      ),
    );
  }
}
