import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/common/theme.dart';

import '../model/skill_model.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width > 750 ? width * 0.15 : 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: AppTheme.backGroundCardColor,
              child: Container(
                height: 400,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Animate(
                          effects: const [
                            ScaleEffect(),
                          ],
                          child: const Row(
                            children: [
                              Text(
                                'About Me',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                width: 250,
                                child: Divider(
                                  thickness: 2,
                                  indent: 2,
                                  endIndent: 2,
                                  color: AppTheme.indicatorColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const CircleAvatar(
                          radius: 150,
                          backgroundImage:
                              AssetImage('assets/images/my_avatar.jpg'),
                        ).animate().slide(
                              begin: const Offset(0, 0.3),
                              duration: const Duration(milliseconds: 300),
                            )
                      ],
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Good day everyone, my name is Le Huynh Phát. I'm a fourth year software engineering student pursuing a career as a mobile application developer. What I enjoy most about my work is the artistic aspect of creation - building applications that are not just functional tools, but deliver memorable experiences.My goal is to craft intuitive, user-friendly apps that attract and retain an engaged audience. Beyond, I aim to imprint each product with a distinct identity and message. Creativity is at the heart of my process, whether designing smooth interfaces or clever interactions that capture user attention.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ).animate().slide(
                                duration: const Duration(milliseconds: 300),
                                begin: const Offset(2, 0),
                                end: const Offset(0, 0),
                                delay: const Duration(milliseconds: 300)),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Whether building for businesses or passion projects, I approach each commission with the same care and dedication. Clients can rely on me to balance aesthetics with usability, ensuring their brand or service is optimally represented in the digital space. If developing engaging mobile experiences piques your interest, please feel free to contact me using the details below. I'm always eager to bring new visions to life through code.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ).animate().slide(
                                duration: const Duration(milliseconds: 300),
                                begin: const Offset(2, 0),
                                end: const Offset(0, 0),
                                delay: const Duration(milliseconds: 1000)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Skills",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const SkillTabbar(),
          ],
        ),
      ),
    );
  }
}

class SkillTabbar extends StatefulWidget {
  const SkillTabbar({super.key});

  @override
  State<SkillTabbar> createState() => _SkillTabbarState();
}

class _SkillTabbarState extends State<SkillTabbar>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  List<bool> selectedSkillList = List.filled(7, false);
  List<SkillModel> skillTechModels = [
    SkillModel(
      image: 'assets/images/flutter_icon.png',
      name: 'Flutter',
      level: 'Competent',
    ),
    SkillModel(
        image: 'assets/images/kotlin_icon.png',
        name: 'Kotlin',
        level: 'Intermediate'),
    SkillModel(
        image: 'assets/images/spring_boot_icon.png',
        name: 'Spring Boot',
        level: 'Intermediate'),
    SkillModel(
        image: 'assets/images/firebase_icon.png',
        name: 'Firebase',
        level: 'Intermediate'),
    SkillModel(
        image: 'assets/images/dart_icon.png', name: 'Dart', level: 'Competent'),
    SkillModel(
        image: 'assets/images/java_icon.png',
        name: 'Java',
        level: 'Intermediate'),
    SkillModel(
        image: 'assets/images/smart_contract_icon.png',
        name: 'Interact Smart Contract',
        level: 'Beginner'),
  ];
  List<SkillModel> skillToolModels = [
    SkillModel(
        image: 'assets/images/git_icon.png',
        name: 'Git',
        level: 'Intermediate'),
    SkillModel(
        image: 'assets/images/github_icon.png',
        name: 'Github',
        level: 'Intermediate'),
    SkillModel(
        image: 'assets/images/mysql_icon.png',
        name: 'MySQL',
        level: 'Beginner'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print("width: $width");
    int _crossAxisCount = 4;
    double _crossAxisSpacing = 32;
    switch (width) {
      case < 1075:
        _crossAxisSpacing = 8;
        _crossAxisCount = 2;

      case < 1400:
        _crossAxisSpacing = 16;
        _crossAxisCount = 3;
    }
    print('_crossAxisCount: $_crossAxisCount');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 250,
          child: TabBar.secondary(
            controller: _tabController,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                8.0,
              ),
              color: AppTheme.indicatorColor.withOpacity(0.3),
            ),
            dividerHeight: 0,
            labelColor: Colors.yellowAccent,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600),
            tabs: const <Widget>[
              Tab(text: 'Tech Stack'),
              Tab(text: 'Tools'),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 250,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              GridView.builder(
                itemCount: skillTechModels.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: _crossAxisSpacing,
                    crossAxisSpacing: _crossAxisSpacing,
                    crossAxisCount: _crossAxisCount,
                    childAspectRatio:
                        ((width - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
                                _crossAxisCount) /
                            100),
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem(skillTechModels[index]);
                },
              ),
              GridView.builder(
                itemCount: skillToolModels.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: _crossAxisSpacing,
                    crossAxisSpacing: _crossAxisSpacing,
                    crossAxisCount: _crossAxisCount,
                    childAspectRatio:
                        ((width - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
                                _crossAxisCount) /
                            100),
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem(skillToolModels[index]);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(SkillModel skillModel) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          skillModel.selected = true;
        });
      },
      onExit: (event) {
        setState(() {
          skillModel.selected = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.indicatorColor, width: 2)),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(
              fit: BoxFit.cover,
              skillModel.image,
              height: 34,
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 172,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    top: skillModel.selected ? 0 : 10,
                    child: SizedBox(
                      width: 175,
                      child: Text(
                        skillModel.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    top: skillModel.selected ? 20 : 50,
                    child: SizedBox(
                      width: 150,
                      child: Text(
                        skillModel.level,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.w400,
                            fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
