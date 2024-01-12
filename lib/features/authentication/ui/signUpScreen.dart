import 'package:accademic_chatbot/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController userNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

final _key = GlobalKey<FormState>();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset(
              'assets/wave.json',
              width: size.width,
              height: size.height * 0.2,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Sign Up",
                style: kLoginTitleStyle(size),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Create Account",
                style: kLoginSubtitleStyle(size),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Form(
              key: _key,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: userNameController,
                      style: kTextFormFieldStyle(),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "UserName",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter UserName";
                        } else if (value.length < 4) {
                          return "At least enter 4 Characters";
                        } else if (value.length > 13) {
                          return "Too large.";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: emailController,
                      style: kTextFormFieldStyle(),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Email";
                        } else if (!value.endsWith("@gmail.com") ) {
                          return "Enter Valid gmail";
                        } else if (value.length > 20) {
                          return "Too large.";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: passwordController,
                      style: kTextFormFieldStyle(),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_open),
                          suffixIcon: Icon(Icons.remove_red_eye_rounded),
                          hintText: "Password",                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter password";
                        } else if (value.length < 6) {
                          return "At least enter 6 Characters";
                        } else if (value.length > 13) {
                          return "Too large.";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: SizedBox(
                      width: size.width,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {}
                        },
                        child: Text("Sign Up"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
