import 'package:accademic_chatbot/features/assesment/assesment.dart';
import 'package:accademic_chatbot/features/authentication/ui/loginScreen.dart';
import 'package:accademic_chatbot/features/chatscreen/ui/chatscreen.dart';
import 'package:accademic_chatbot/features/counsellors/counsellor_screen.dart';
import 'package:accademic_chatbot/features/studymaterial/studymaterial.dart';
import 'package:accademic_chatbot/utils/constants.dart';
import 'package:accademic_chatbot/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.18), // Set this height
        child: Padding(
          padding: EdgeInsets.fromLTRB(size.width * 0.075, size.width * 0.13,
              size.width * 0.075, size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.09,
                height: size.width * 0.09,
                child: InkWell(
                  onTap: () async {
                    // ref.read(zoomController).open!();
                  },
                  child: Image.asset("assets/menu.jpg", fit: BoxFit.fill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("We Chat",
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold
                ),),
              )
              // CircleAvatar(
              //   child: Image.asset(
              //     "assets/logo.png",
              //     fit: BoxFit.contain,
              //   ),
              //   backgroundColor: Colors.white,
              //   radius: size.width * 0.05,
              // ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(size.width * 0.075, size.width * 0.05,
            size.width * 0.075, size.width * 0.075),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(
                    right: size.width *
                        0.35 /
                        (7)),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Hi Chinmay',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 14,
                child: SizedBox(
                  width: size.width * 0.85,
                  child: Lottie.asset(
                    "assets/homescreen.json",
                    fit: BoxFit.contain,
                    frameRate: FrameRate(30),
                  ),
                )),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCell(
                    size,
                    title: "Assesment",
                    color: mildViolet,
                    icon: "assesment",
                    paddingPercentage: 0.025,
                    page: QuizScreen(),
                  ),
                  buildCell(
                    size,
                    title: "General Chat",
                    color: mildBlue,
                    icon: "chat",
                    paddingPercentage: 0.03,
                    page: ChatScreen(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.05 * size.width,
            ),
            Expanded(
              flex: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCell(
                    size,
                    title: "Study Material",
                    color: mildRed,
                    icon: "books",
                    paddingPercentage: 0.02,
                    page: StudyMaterial(),
                  ),
                  buildCell(
                    size,
                    title: "Counsellor",
                    color: mildGreen,
                    icon: "counsellor",
                    paddingPercentage: 0.03,
                    page: DevelopersPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}