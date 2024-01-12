import 'package:accademic_chatbot/features/authentication/bloc/authentication_bloc_bloc.dart';
import 'package:accademic_chatbot/features/authentication/ui/forgotPasswordScreen.dart';
import 'package:accademic_chatbot/features/authentication/ui/signUpScreen.dart';
import 'package:accademic_chatbot/features/homescreen/ui/homescreen.dart';
import 'package:accademic_chatbot/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthenticationBlocBloc authBloc=AuthenticationBlocBloc();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<AuthenticationBlocBloc, AuthenticationBlocState>(
      bloc : authBloc,
      listenWhen: (previous,current)=>current is AuthenticationBlocActionState,
      buildWhen: (previous,current)=>current is !AuthenticationBlocActionState,
      listener: (context, state) {
          if(state is NavigateToForgotPasswordScreenState)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
          }
          else if(state is NavigateToSignUpScreenScreenState)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
          }
          else if(state is NavigateToHomeScreenState)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          }
      },
      builder: (context, state) {
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
                    "Login",
                    style: kLoginTitleStyle(size),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Hey Champ..",
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
                            } else if (!value.endsWith("@gmail.com")) {
                              return "Enter Valid gmail";
                            } else if (value.length > 40) {
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
                      GestureDetector(
                        onTap: () {
                          authBloc.add(ForgotPasswordButtonPressedEvent());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Forgot Password",
                              style: kLoginSubtitleStyle(size / 1.6),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10),
                        child: SizedBox(
                          width: size.width,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                authBloc.add(LoginButtonPressedEvent());
                              }
                            },
                            child: Text("Login"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ",
                            style: kHaveAnAccountStyle(size),
                          ),
                          GestureDetector(
                            onTap: () {
                              authBloc.add(DontHaveAccountButtonPressedEvent());
                            },
                            child: Text(
                              "Click Here",
                              style: kHaveAnAccountStyle(size).copyWith(
                                color: Colors.purple[400],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
