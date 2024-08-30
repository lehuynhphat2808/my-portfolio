import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/theme.dart';
import 'dart:html' as html;

class KonanTuneDetailPageMobile extends StatefulWidget {
  const KonanTuneDetailPageMobile({super.key});

  @override
  State<KonanTuneDetailPageMobile> createState() =>
      _KonanTuneDetailPageMobileState();
}

class _KonanTuneDetailPageMobileState extends State<KonanTuneDetailPageMobile> {
  TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 16);

  List<String> projectImages = [
    'assets/images/konan_tune/1.png',
    'assets/images/konan_tune/2.png',
    'assets/images/konan_tune/3.png',
    'assets/images/konan_tune/4.png',
    'assets/images/konan_tune/5.png',
    'assets/images/konan_tune/6.png',
    'assets/images/konan_tune/7.png',
    'assets/images/konan_tune/8.png',
    'assets/images/konan_tune/9.png',
    'assets/images/konan_tune/10.png',
    'assets/images/konan_tune/11.png',
    'assets/images/konan_tune/12.png',
    'assets/images/konan_tune/13.png',
  ];
  CarouselSliderController buttonCarouselController =
      CarouselSliderController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 100;
    return Scaffold(
      backgroundColor: AppTheme.appBackground,
      body: Column(
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
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
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
                  'App for buying and selling musical instruments',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  'Kotlin, Spring boot',
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
                        "– Describe Project: The application allows buying and selling musical instruments approved by the administrator.",
                        style: textStyle,
                      ),
                      Text(
                        "– Technology: MVVM structure, Spring Boot, Kotlin, MySQL.",
                        style: textStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          html.window.open(
                              'https://github.com/lehuynhphat2808/konan-tune',
                              "Le Huynh Phat konan's tune");
                        },
                        child: Container(
                          color: AppTheme.indicatorColor.withOpacity(0.3),
                          child: Text(
                            '– Github: https://github.com/lehuynhphat2808/konan-tune',
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
    );
  }
}
