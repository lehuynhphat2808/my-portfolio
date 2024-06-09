import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/common/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Color.fromRGBO(50, 50, 50, 1.0),
            child: Container(
              height: 400,
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                children: [
                  Column(
                    children: [
                      Row(
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
                      SizedBox(
                        height: 8,
                      ),
                      CircleAvatar(
                        radius: 150,
                        backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Good day everyone, my name is Le Huynh Phát. I'm a fourth year software engineering student pursuing a career as a mobile application developer. What I enjoy most about my work is the artistic aspect of creation - building applications that are not just functional tools, but deliver memorable experiences.My goal is to craft intuitive, user-friendly apps that attract and retain an engaged audience. Beyond, I aim to imprint each product with a distinct identity and message. Creativity is at the heart of my process, whether designing smooth interfaces or clever interactions that capture user attention.",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Whether building for businesses or passion projects, I approach each commission with the same care and dedication. Clients can rely on me to balance aesthetics with usability, ensuring their brand or service is optimally represented in the digital space. If developing engaging mobile experiences piques your interest, please feel free to contact me using the details below. I'm always eager to bring new visions to life through code.",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Row(
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
          SizedBox(
            height: 8,
          ),
          SkillTabbar(),
        ],
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
  bool isToolsTab = false;

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
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 32,
                    crossAxisSpacing: 32,
                    crossAxisCount: 4,
                    childAspectRatio: 3.5),
                children: [
                  _buildItem('assets/images/flutter_icon.png', 'Flutter'),
                  _buildItem('assets/images/kotlin_icon.png', 'Kotlin'),
                  _buildItem(
                      'assets/images/spring_boot_icon.png', 'Spring Boot'),
                  _buildItem('assets/images/firebase_icon.png', 'Firebase'),
                  _buildItem('assets/images/dart_icon.png', 'Dart'),
                  _buildItem('assets/images/java_icon.png', 'Java'),
                  _buildItem('assets/images/smart_contract_icon.png',
                      'Interact Smart Contract'),
                ],
              ),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 32,
                    crossAxisSpacing: 32,
                    crossAxisCount: 4,
                    childAspectRatio: 3.5),
                children: [
                  _buildItem('assets/images/git_icon.png', 'Git'),
                  _buildItem('assets/images/github_icon.png', 'Github'),
                  _buildItem('assets/images/mysql_icon.png', 'MySQL'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(String imageLink, String text) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.indicatorColor, width: 2)),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Image.asset(
            fit: BoxFit.cover,
            imageLink,
            height: 34,
          ),
          SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 150,
            child: Text(
              text,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
