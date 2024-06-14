import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/common/theme.dart';
import 'dart:html' as html;

class PortfolioDetailPage extends StatefulWidget {
  const PortfolioDetailPage({super.key});

  @override
  State<PortfolioDetailPage> createState() => _PortfolioDetailPageState();
}

class _PortfolioDetailPageState extends State<PortfolioDetailPage> {
  CarouselController buttonCarouselController = CarouselController();
  int currentPage = 0;
  List<String> projectImages = [
    'assets/images/portfolio/1.png',
    'assets/images/portfolio/2.png',
    'assets/images/portfolio/3.png',
    'assets/images/portfolio/4.png',
  ];
  TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 16);
  bool hoverGithub = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppTheme.appBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.75,
              child: Stack(
                children: [
                  Container(
                    height: height * 0.75,
                    width: width,
                    color: AppTheme.backGroundCardColor,
                    // padding:
                    //     EdgeInsets.symmetric(horizontal: width * 0.2, vertical: 32),
                    child: CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        viewportFraction: 1.1,
                      ),
                      items: projectImages.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: const BoxDecoration(
                                    color: AppTheme.backGroundCardColor),
                                child: Image.asset(
                                  i,
                                  fit: BoxFit.cover,
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
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Portfolio Website',
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
                          "– Describe Project: My personal website, I created this website to display my profile, skiils and projects. As woll as my place to try new technology.",
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
                                  'https://github.com/lehuynhphat2808/my-portfolio',
                                  'Le Huynh Phat portfolio');
                            },
                            child: Container(
                              color: hoverGithub
                                  ? AppTheme.indicatorColor.withOpacity(0.3)
                                  : null,
                              child: Text(
                                '– Github: https://github.com/lehuynhphat2808/my-portfolio',
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
          ],
        ),
      ),
    );
  }
}
