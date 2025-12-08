import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/theme.dart';
import 'package:portfolio/widget/home_button.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:html' as html;

import '../../widget/ytb_player.dart';

class ChattingDetailPage extends StatefulWidget {
  const ChattingDetailPage({super.key});

  @override
  State<ChattingDetailPage> createState() => _ChattingDetailPageState();
}

class _ChattingDetailPageState extends State<ChattingDetailPage> {
  TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 16);
  bool hoverGithub = false;

  List<String> projectImages = [
    'assets/images/chatting/1.png',
    'assets/images/chatting/2.png',
    'assets/images/chatting/3.png',
    'assets/images/chatting/4.png',
    'assets/images/chatting/5.png',
    'assets/images/chatting/6.png',
    'assets/images/chatting/7.png',
    'assets/images/chatting/8.png',
    'assets/images/chatting/9.png',
  ];
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  int currentPage = 0;

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
                                      width: MediaQuery.of(context).size.width,
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
                        "Chatting App",
                        style: const TextStyle(
                            fontSize: 36, fontWeight: FontWeight.w800),
                        colors: const [
                          AppTheme.indicatorColor,
                          Colors.white,
                        ],
                      ),
                      const Text(
                        'Flutter, Firebase',
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
                              "The Chatting App is a modern messaging platform that enables real-time communication between users. Its user-friendly interface and customizable themes make it easy to connect with friends and family, ensuring that important messages are never missed..",
                              style: textStyle,
                            ),
                            Text(
                              "– Technology: Flutter, Firebase",
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
