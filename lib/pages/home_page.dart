import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/animation/my_typewriter.dart';
import 'package:portfolio/common/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Colors.white, AppTheme.indicatorColor],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello World, I'm",
                  style: TextStyle(
                      color: AppTheme.indicatorColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                Text(
                  'LH Phat',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60 - 4000 / width,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      MyTypewriterAnimatedText('Mobile Developer',
                          textStyle: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient),
                          speed: Duration(milliseconds: 250)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Welcome to My Persional Website',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Colors.transparent,
                AppTheme.indicatorColor.withOpacity(0.2),
                AppTheme.indicatorColor.withOpacity(0.1),
                AppTheme.indicatorColor.withOpacity(0.05),
                AppTheme.indicatorColor.withOpacity(0.02),
              ],
              tileMode: TileMode.decal,
              center: Alignment.center,
              radius: 0.5,
              stops: const [0.75, 0.8, 0.85, 0.9, 0.95],
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(width * 0.022),
            width: width * 0.16,
            height: width * 0.16,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xffece5c3), width: 2),
                shape: BoxShape.circle,
                image: const DecorationImage(
                    image: AssetImage('assets/images/avatar.jpg'),
                    fit: BoxFit.cover)),
          ),
        )
      ],
    );
  }
}
