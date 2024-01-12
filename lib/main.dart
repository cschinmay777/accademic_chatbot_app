import 'package:accademic_chatbot/features/assesment/assesment.dart';
import 'package:accademic_chatbot/features/authentication/ui/forgotPasswordScreen.dart';
import 'package:accademic_chatbot/features/authentication/ui/loginScreen.dart';
import 'package:accademic_chatbot/features/authentication/ui/signUpScreen.dart';
import 'package:accademic_chatbot/features/chatscreen/ui/chatscreen.dart';
import 'package:accademic_chatbot/features/counsellors/counsellor_screen.dart';
import 'package:accademic_chatbot/features/homescreen/ui/homescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
