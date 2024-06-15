import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/common/theme.dart';
import 'dart:html' as html;

class QuizletCloneDetailPageMobile extends StatefulWidget {
  const QuizletCloneDetailPageMobile({super.key});

  @override
  State<QuizletCloneDetailPageMobile> createState() =>
      _QuizletCloneDetailPageMobileState();
}

class _QuizletCloneDetailPageMobileState
    extends State<QuizletCloneDetailPageMobile> {
  TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 16);

  List<String> projectImages = [
    'assets/images/quizlet_clone/0.png',
    'assets/images/quizlet_clone/1.png',
    'assets/images/quizlet_clone/2.png',
    'assets/images/quizlet_clone/3.png',
    'assets/images/quizlet_clone/4.png',
    'assets/images/quizlet_clone/5.png',
    'assets/images/quizlet_clone/6.png',
    'assets/images/quizlet_clone/7.png',
    'assets/images/quizlet_clone/8.png',
    'assets/images/quizlet_clone/9.png',
    'assets/images/quizlet_clone/10.png',
    'assets/images/quizlet_clone/11.png',
    'assets/images/quizlet_clone/12.png',
    'assets/images/quizlet_clone/13.png',
    'assets/images/quizlet_clone/14.png',
    'assets/images/quizlet_clone/15.png',
    'assets/images/quizlet_clone/16.png',
    'assets/images/quizlet_clone/17.png',
    'assets/images/quizlet_clone/18.png',
    'assets/images/quizlet_clone/19.png',
  ];
  CarouselController buttonCarouselController = CarouselController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 100;
    return Scaffold(
      backgroundColor: AppTheme.appBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: height * 0.7,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height,
                    child: CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        height: double.maxFinite,
                        viewportFraction: 1,
                      ),
                      items: projectImages.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              i,
                              fit: BoxFit.fitHeight,
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          if (currentPage < projectImages.length - 1) {
                            setState(() {
                              currentPage++;
                            });
                            buttonCarouselController.animateToPage(currentPage);
                          }
                        },
                        icon: ImageIcon(
                          const AssetImage('assets/images/next_icon.png'),
                          color: currentPage < projectImages.length - 1
                              ? AppTheme.indicatorColor
                              : Colors.grey.withOpacity(0.3),
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        onPressed: () {
                          if (currentPage > 0) {
                            setState(() {
                              currentPage--;
                            });
                            buttonCarouselController.animateToPage(currentPage);
                          }
                        },
                        icon: ImageIcon(
                          const AssetImage('assets/images/back_icon.png'),
                          color: currentPage > 0
                              ? AppTheme.indicatorColor
                              : Colors.grey.withOpacity(0.3),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Foreign language vocabulary learning application',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
                    'Flutter, Dart',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.indicatorColor),
                  ),
                  const Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "– Describe Project: The application supports users in learning English vocabulary in flashcard format, similar to the Quizlet application. Basically, the application allows users to create their own topics containing vocabulary related to a specific topic, then study and practice through a variety of quizzes and exercises.",
                          style: textStyle,
                        ),
                        Text(
                          "– Technology: Flutter framework , Bloc pattern, Docker.",
                          style: textStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            html.window.open(
                                'https://github.com/lehuynhphat2808/quizlet-frontend',
                                'Le Huynh Phat quizlet-clone');
                          },
                          child: Container(
                            color: AppTheme.indicatorColor.withOpacity(0.3),
                            child: Text(
                              '– Github: https://github.com/lehuynhphat2808/quizlet-frontend',
                              style: textStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
