import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/theme.dart';
import 'package:portfolio/widget/home_widget.dart';

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
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width > 750 ? width * 0.15 : 10),
          child: Column(
            children: [
              _buildTabBar(),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    HomeWidget(),
                    Center(
                      child: Text("It's rainy here"),
                    ),
                    Center(
                      child: Text("It's sunny here"),
                    ),
                    Center(
                      child: Text("4"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'leHuynhPhat();',
          style: TextStyle(
              color: AppTheme.indicatorColor,
              fontWeight: FontWeight.w800,
              fontSize: 20),
        ),
        SizedBox(
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
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.github,
            size: 24,
          ),
          color: Colors.white,
        )
      ],
    );
  }
}
