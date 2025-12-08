import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/theme.dart';
import 'dart:html' as html;
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../data/constants.dart';

class EfusionDetailPage extends StatefulWidget {
  const EfusionDetailPage({super.key});

  @override
  State<EfusionDetailPage> createState() => EfusionDetailPageState();
}

class EfusionDetailPageState extends State<EfusionDetailPage> {
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  int currentPage = 0;
  List<String> projectImages = [
    'assets/images/efusion/1.jpg',
    'assets/images/efusion/2.jpg',
    'assets/images/efusion/3.jpg',
    'assets/images/efusion/4.jpg',
    'assets/images/efusion/5.jpg',
    'assets/images/efusion/6.jpg',
    'assets/images/efusion/7.jpg',
    'assets/images/efusion/8.jpg',
    'assets/images/efusion/9.jpg',
    'assets/images/efusion/10.jpg',
    'assets/images/efusion/11.jpg',
    'assets/images/efusion/12.jpg',
    'assets/images/efusion/13.jpg',
    'assets/images/efusion/14.jpg',
    'assets/images/efusion/15.jpg',
    'assets/images/efusion/16.jpg',
    'assets/images/efusion/17.jpg',
    'assets/images/efusion/18.jpg',
    'assets/images/efusion/19.jpg',
    'assets/images/efusion/20.jpg',
    'assets/images/efusion/21.jpg',
    'assets/images/efusion/22.jpg',
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
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: DeviceFrame(
                                    device: Devices.android.samsungGalaxyS25,
                                    screen: Image.asset(
                                      i,
                                    ),
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
                        "Efusion Mobile App",
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
                              "– Describe Project: A mobile app for buying pet-specific products like food, toys, accessories, and health items. Features include easy browsing, order tracking, product reviews, and personalized recommendations.",
                              style: textStyle,
                            ),
                            Text(
                              "– Tech stack: Dart, Flutter, Clean Architecture.",
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
                                      'https://github.com/lehuynhphat2808/konan-tune',
                                      "Le Huynh Phat konan's tune");
                                },
                                child: Container(
                                  color: hoverGithub
                                      ? AppTheme.indicatorColor.withOpacity(0.3)
                                      : null,
                                  child: Text(
                                    '– Github: https://github.com/lehuynhphat2808/konan-tune',
                                    style: textStyle,
                                  ),
                                ),
                              ),
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
