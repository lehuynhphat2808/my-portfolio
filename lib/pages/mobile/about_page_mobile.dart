import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/common/theme.dart';
import 'package:portfolio/model/skill_item_model.dart';

import '../../model/skill_model.dart';

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
                height: 600,
                padding: const EdgeInsets.all(16.0),
                child: Column(
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
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          SizedBox(
                            width: 100,
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
                      radius: 100,
                      backgroundImage:
                          AssetImage('assets/images/my_avatar.jpg'),
                    ).animate().slide(
                          begin: const Offset(0, 0.3),
                          duration: const Duration(milliseconds: 300),
                        ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Good day everyone, my name is Le Huynh Phat. I'm a fourth year software engineering student pursuing a career as a mobile application developer. What I enjoy most about my work is the artistic aspect of creation - building applications that are not just functional tools, but deliver memorable experiences.My goal is to craft intuitive, user-friendly apps that attract and retain an engaged audience. Beyond, I aim to imprint each product with a distinct identity and message. Creativity is at the heart of my process, whether designing smooth interfaces or clever interactions that capture user attention.",
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
  List<SkillItemModel> skillTechItemModels = [
    SkillItemModel(
      crossAxisCellCount: 8,
      mainAxisCellCount: 3,
      skillModel: SkillModel(
        image: 'assets/images/flutter_icon.png',
        name: 'Flutter',
        level: 'Competent',
      ),
    ),
    SkillItemModel(
      crossAxisCellCount: 8,
      mainAxisCellCount: 3,
      skillModel: SkillModel(
          image: 'assets/images/kotlin_icon.png',
          name: 'Kotlin',
          level: 'Intermediate'),
    ),
    SkillItemModel(
      crossAxisCellCount: 8,
      mainAxisCellCount: 3,
      skillModel: SkillModel(
          image: 'assets/images/spring_boot_icon.png',
          name: 'Spring Boot',
          level: 'Intermediate'),
    ),
    SkillItemModel(
      crossAxisCellCount: 8,
      mainAxisCellCount: 3,
      skillModel: SkillModel(
          image: 'assets/images/firebase_icon.png',
          name: 'Firebase',
          level: 'Intermediate'),
    ),
    SkillItemModel(
      crossAxisCellCount: 8,
      mainAxisCellCount: 3,
      skillModel: SkillModel(
          image: 'assets/images/dart_icon.png',
          name: 'Dart',
          level: 'Competent'),
    ),
    SkillItemModel(
      crossAxisCellCount: 8,
      mainAxisCellCount: 3,
      skillModel: SkillModel(
          image: 'assets/images/java_icon.png',
          name: 'Java',
          level: 'Intermediate'),
    ),
    SkillItemModel(
      crossAxisCellCount: 16,
      mainAxisCellCount: 3,
      skillModel: SkillModel(
          image: 'assets/images/smart_contract_icon.png',
          name: 'Interact Smart Contract',
          level: 'Beginner'),
    ),
  ];
  List<SkillItemModel> skillToolItemModels = [
    SkillItemModel(
      crossAxisCellCount: 8,
      mainAxisCellCount: 3,
      skillModel: SkillModel(
          image: 'assets/images/git_icon.png',
          name: 'Git',
          level: 'Intermediate'),
    ),
    SkillItemModel(
      crossAxisCellCount: 8,
      mainAxisCellCount: 3,
      skillModel: SkillModel(
          image: 'assets/images/github_icon.png',
          name: 'Github',
          level: 'Intermediate'),
    ),
    SkillItemModel(
      crossAxisCellCount: 8,
      mainAxisCellCount: 3,
      skillModel: SkillModel(
          image: 'assets/images/github_icon.png',
          name: 'Github',
          level: 'Intermediate'),
    ),
    SkillItemModel(
      crossAxisCellCount: 8,
      mainAxisCellCount: 3,
      skillModel: SkillModel(
          image: 'assets/images/mysql_icon.png',
          name: 'MySQL',
          level: 'Beginner'),
    ),
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
    int crossAxisCount = 2;
    double crossAxisSpacing = 8;

    return SingleChildScrollView(
      child: Column(
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
          SizedBox(
            height: 400,
            child: TabBarView(
              controller: _tabController,
              children: [
                StaggeredGrid.count(
                    axisDirection: AxisDirection.down,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: 16,
                    children: skillTechItemModels
                        .map((e) => StaggeredGridTile.count(
                              crossAxisCellCount: e.crossAxisCellCount,
                              mainAxisCellCount: e.mainAxisCellCount,
                              child: _buildItem(e),
                            ))
                        .toList()),
                StaggeredGrid.count(
                    axisDirection: AxisDirection.down,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: 16,
                    children: skillToolItemModels
                        .map((e) => StaggeredGridTile.count(
                              crossAxisCellCount: e.crossAxisCellCount,
                              mainAxisCellCount: e.mainAxisCellCount,
                              child: _buildItem(e),
                            ))
                        .toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(SkillItemModel skillItemModel) {
    SkillModel skillModel = skillItemModel.skillModel;
    return GestureDetector(
      onTap: () {
        setState(() {
          skillModel.selected = !skillModel.selected;
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
              width: 12.5 * skillItemModel.crossAxisCellCount,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    top: skillModel.selected ? 0 : 10,
                    child: SizedBox(
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
                    duration: const Duration(milliseconds: 500),
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
