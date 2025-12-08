import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/theme.dart';
import 'package:portfolio/widget/home_button.dart';
import 'package:portfolio/widget/ytb_player.dart';
import 'dart:html' as html;

import 'package:simple_gradient_text/simple_gradient_text.dart';

class QuizletCloneDetailPage extends StatefulWidget {
  const QuizletCloneDetailPage({super.key});

  @override
  State<QuizletCloneDetailPage> createState() => _QuizletCloneDetailPageState();
}

class _QuizletCloneDetailPageState extends State<QuizletCloneDetailPage> {
  TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 16);
  bool hoverGithub = false;

  List<String> projectImages = [
    '8Gt3Npgoz6A',
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
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  int currentPage = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
            height: 850,
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: CarouselSlider(
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                            viewportFraction: 0.2,
                            initialPage: 0,
                            scrollDirection: Axis.horizontal,
                            enableInfiniteScroll: true,
                            disableCenter: false,
                            enlargeCenterPage: true,
                          ),
                          items: projectImages.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return !i.contains("assets/images/")
                                    ? Stack(children: [
                                        Container(
                                          margin: const EdgeInsets.all(22),
                                          height: double.maxFinite,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              child: YtbPlayer(src: i)),
                                        ),
                                        Image.asset(
                                          'assets/images/mobile_phone_frame.png',
                                          height: double.maxFinite,
                                          width: double.maxFinite,
                                          fit: BoxFit.fill,
                                        ),
                                      ])
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Image.asset(
                                          i,
                                        ));
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                currentPage =
                                    (currentPage + 1) % projectImages.length;
                              });
                              buttonCarouselController
                                  .animateToPage(currentPage);
                            },
                            icon: const ImageIcon(
                                AssetImage('assets/images/next_icon.png'),
                                color: AppTheme.indicatorColor)),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                currentPage =
                                    (currentPage - 1) % projectImages.length;
                              });
                              buttonCarouselController
                                  .animateToPage(currentPage);
                            },
                            icon: const ImageIcon(
                                AssetImage('assets/images/back_icon.png'),
                                color: AppTheme.indicatorColor)),
                      ),
                      const HomeButtonOverlay(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GradientText(
                              "Foreign language vocabulary learning application",
                              style: const TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.w800),
                              colors: const [
                                AppTheme.indicatorColor,
                                Colors.white,
                              ],
                            ),
                            const Text(
                              'Flutter, Dart',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.indicatorColor),
                            ),
                            const SizedBox(
                              height: 8,
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
                                  MouseRegion(
                                    onHover: (event) {
                                      setState(() {
                                        hoverGithub = true;
                                      });
                                    },
                                    onExit: (event) {
                                      setState(() {
                                        hoverGithub = false;
                                      });
                                    },
                                    child: GestureDetector(
                                      onTap: () {
                                        html.window.open(
                                            'https://github.com/lehuynhphat2808/quizlet-frontend',
                                            'Le Huynh Phat quizlet-clone');
                                      },
                                      child: Container(
                                        color: hoverGithub
                                            ? AppTheme.indicatorColor
                                                .withOpacity(0.3)
                                            : null,
                                        child: Text(
                                          '– Github: https://github.com/lehuynhphat2808/quizlet-frontend',
                                          style: textStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
