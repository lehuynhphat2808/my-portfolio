import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/model/project_model.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:html' as html;

import '../common/theme.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  List<ProjectModel> projectModelList = [
    ProjectModel(
        image: 'assets/images/portfolio_project.png',
        name: 'Personal Website',
        detail:
            "My personal website, I created this website to display my profile, skiils and projects. As woll as my place to try new technology.",
        tech: 'Dart, Flutter',
        github: 'https://github.com/lehuynhphat2808/my-portfolio'),
    ProjectModel(
        image: 'assets/images/quizlet_project.png',
        name: 'Quizlet Clone',
        detail:
            "The application supports users in learning English vocabulary in flashcard format, similar to the Quizlet application. Basically, the application allows users to create their own topics containing vocabulary related to a specific topic, then study and practice through a variety of quizzes and exercises.",
        tech: 'Dart, Flutter, Spring Boot',
        github: 'https://github.com/lehuynhphat2808/quizlet-frontend'),
    ProjectModel(
        image: 'assets/images/konan_tune_project.png',
        name: "Konan's Tune",
        detail:
            "This musical instrument app allows buyers and sellers to conveniently transact approved items. Administrators screen listings to maintain accurate product details for various guitars, pianos, drums and other available instruments. Buyers can browse detailed listings with photos and prices to compare and purchase items through secure online transactions. Sellers must register to submit their posts for review. Reviews from past customers provide valuable feedback on each item page. The app intends to connect a community of music lovers through a curated marketplace while the administrators ensure quality of content and purchase experiences.",
        tech: 'Kotlin, Spring Boot',
        github: 'https://github.com/lehuynhphat2808/konan-tune'),
    // ProjectModel(
    //     image: 'assets/images/konan_tune_project.png',
    //     name: "Konan's Tune",
    //     detail:
    //         "This musical instrument app allows buyers and sellers to conveniently transact approved items. Administrators screen listings to maintain accurate product details for various guitars, pianos, drums and other available instruments. Buyers can browse detailed listings with photos and prices to compare and purchase items through secure online transactions. Sellers must register to submit their posts for review. Reviews from past customers provide valuable feedback on each item page. The app intends to connect a community of music lovers through a curated marketplace while the administrators ensure quality of content and purchase experiences.",
    //     tech: 'Kotlin, Spring Boot'),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Past Project Experience',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 4,
          ),
          GradientText("Explore the projects I've worked on so far",
              colors: const [Colors.white, AppTheme.indicatorColor]),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width ~/ 475,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.95),
              children:
                  projectModelList.map((e) => _buildProjectItem(e)).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProjectItem(ProjectModel projectModel) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          projectModel.isSelected = true;
        });
      },
      onExit: (event) {
        setState(() {
          projectModel.isSelected = false;
        });
      },
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            top: projectModel.isSelected ? 0 : 20,
            child: GestureDetector(
              onTap: () {
                projectModel.github.isNotEmpty
                    ? html.window.open(projectModel.github, projectModel.name)
                    : null;
              },
              child: Container(
                foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: projectModel.isSelected
                        ? Colors.grey.withOpacity(0.2)
                        : Colors.transparent),
                child: Card(
                  color: AppTheme.backGroundCardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: const BorderSide(
                          color: AppTheme.unClickColor, width: 2)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      image: AssetImage(projectModel.image),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                projectModel.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                projectModel.detail,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    projectModel.tech,
                                    style: const TextStyle(
                                      color: Color(0xffb0af9b),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.github,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  CupertinoIcons.share,
                                  color: Colors.white,
                                  size: 16,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
