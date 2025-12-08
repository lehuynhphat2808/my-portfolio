import 'package:carousel_slider/carousel_slider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/theme.dart';
import 'package:portfolio/widget/home_button.dart';

class XFWDetailPage extends StatefulWidget {
  const XFWDetailPage({super.key});

  @override
  State<XFWDetailPage> createState() => XFWDetailPageState();
}

class XFWDetailPageState extends State<XFWDetailPage> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  int currentPage = 0;
  List<String> projectImages = [
    'assets/images/xfw/1.png',
    'assets/images/xfw/2.png',
    'assets/images/xfw/3.png',
    'assets/images/xfw/4.png',
    'assets/images/xfw/5.png',
    'assets/images/xfw/6.png',
    'assets/images/xfw/7.png',
    'assets/images/xfw/8.png',
    'assets/images/xfw/9.png',
    'assets/images/xfw/10.png',
    'assets/images/xfw/11.png',
    'assets/images/xfw/12.png',
    'assets/images/xfw/13.png',
    'assets/images/xfw/14.png',
  ];
  TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 16);
  bool hoverGithub = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackground,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 850,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          viewportFraction: 0.3,
                          initialPage: 0,
                          scrollDirection: Axis.horizontal,
                          enableInfiniteScroll: true,
                          disableCenter: false,
                          enlargeCenterPage: true,
                        ),
                        items: projectImages.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Image.asset(
                                  i,
                                ),
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
                            setState(() {
                              currentPage =
                                  (currentPage + 1) % projectImages.length;
                            });
                            buttonCarouselController.animateToPage(currentPage);
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
                            buttonCarouselController.animateToPage(currentPage);
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
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GradientText(
                        "XFW",
                        style: const TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w800),
                        colors: const [
                          AppTheme.indicatorColor,
                          Colors.white,
                        ],
                      ),
                      const Text(
                        'Dart, Flutter',
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
                              "– Describe Project: A work management and team communication app with chat threads (like Slack), task creation, payments, and collaboration features similar to Zalo/Microsoft Teams.",
                              style: textStyle,
                            ),
                            Text(
                              "– Tech stack: Dart, Flutter, Clean Architecture, CQRS.",
                              style: textStyle,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
