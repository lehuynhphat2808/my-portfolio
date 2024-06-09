import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/theme.dart';
import 'package:portfolio/pages/about_page.dart';
import 'package:portfolio/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xff111011),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 160,
          leading: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'leHuynhPhat();',
              style: TextStyle(
                  color: AppTheme.indicatorColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
          ),
          title: _buildTabBar(),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  size: 24,
                ),
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width > 750 ? width * 0.15 : 10),
          child: TabBarView(
            children: <Widget>[
              HomePage(),
              AboutPage(),
              Center(
                child: Text("It's sunny here"),
              ),
              Center(
                child: Text("4"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return SizedBox(
      width: 300,
      child: TabBar(
        unselectedLabelStyle: GoogleFonts.zcoolXiaoWei(
            textStyle: const TextStyle(
                color: AppTheme.unClickColor,
                fontWeight: FontWeight.w600,
                fontSize: 12)),
        labelStyle: GoogleFonts.zcoolXiaoWei(
            textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12)),
        dividerColor: Colors.transparent,
        indicatorColor: AppTheme.indicatorColor,
        tabs: <Widget>[
          Tab(
            text: 'Home',
          ),
          Tab(
            text: 'About',
          ),
          Tab(
            text: 'Portfolio',
          ),
          Tab(
            text: 'Blog',
          ),
        ],
      ),
    );
  }
}
