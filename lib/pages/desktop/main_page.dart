import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/common/theme.dart';
import 'package:portfolio/pages/desktop/about_page.dart';
import 'package:portfolio/pages/desktop/blog_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

import '../../router/router_manager.dart';
import 'home_page.dart';
import 'portfolio_page.dart';

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
        backgroundColor: AppTheme.appBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 160,
          leading: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'leHuynhPhat();',
                style: TextStyle(
                    color: AppTheme.indicatorColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
            ),
          ),
          title: _buildTabBar(),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  _launchCallClient('+84 387790894');
                },
                icon: const Icon(
                  Icons.call,
                  size: 24,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  _launchMailClient('lehuynhphat2808@gmail.com');
                },
                icon: const Icon(
                  Icons.email,
                  size: 24,
                  color: Colors.white,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {
                  html.window.open('https://github.com/lehuynhphat2808',
                      'Le Huynh Phat github');
                },
                icon: const FaIcon(
                  FontAwesomeIcons.github,
                  size: 24,
                ),
                color: Colors.white,
              ),
            )
          ],
        ),
        body: const TabBarView(
          children: <Widget>[
            HomePage(),
            AboutPage(),
            PortfolioPage(),
            BlogPage(),
          ],
        ),
      ),
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void _launchMailClient(String targetEmail) async {
    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: targetEmail,
        query: encodeQueryParameters(<String, String>{
          'subject': 'Hi LH Phat',
        }),
      );

      await launchUrl(emailLaunchUri);
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: targetEmail));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Cannot open mail. Email was copied to Clipboard')));
    }
  }

  void _launchCallClient(String phoneNumber) async {
    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );

      await launchUrl(emailLaunchUri);
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: phoneNumber));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Cannot make call. Phone number was copied to Clipboard')));
    }
  }

  Widget _buildTabBar() {
    return SizedBox(
      width: 315,
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
        tabs: const <Widget>[
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
