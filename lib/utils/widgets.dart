import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

Widget buildCell(Size size,
      {required String title,
      required String icon,
      required Color color,
      required double paddingPercentage,
      required Widget page}) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration(milliseconds: 400),
      openBuilder: (context, _) => page,
      closedElevation: 0,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(size.width * 0.07),
      ),
      closedColor: color,
      middleColor: color,
      closedBuilder: (context, _) => SizedBox(
        height: double.infinity,
        width: size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: Container(
                width: size.width * 0.17,
                height: size.width * 0.17,
                color: Colors.white,
                alignment: Alignment.center,
                padding: EdgeInsets.all(size.width * paddingPercentage),
                child: Image.asset(
                  "assets/$icon.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.width * 0.015),
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
