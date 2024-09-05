import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/model/blog_model.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'dart:html' as html;
import '../../common/theme.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  late double width;
  List<BlogModel> blogmodelList = [
    BlogModel(
        date: DateTime(2024, 11, 6),
        image: 'assets/images/portfolio_project.png',
        name: 'My First Blog Post on My New Website',
        detail:
            "In this first blog post, I wanted to share my excitement about launching my new personal website and starting my first blog. The post chronicles my journey so far - from planning the website over many months, to finally launching it and publishing my inaugural blog entry. I described the significance of this first post in marking the beginning of a new chapter. My goal was to capture my enthusiasm and motivation for this online venture, which will allow me to freely share my knowledge and passions. The post aims to give readers a sense of this new journey I'm embarking on. Through engaging and inspiring writing, I hope to attract an audience who will join me on my blogging adventures going forward. This initial post sets the stage for what I hope to be an exciting hobby and creative outlet.")
  ];
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: width > 750 ? width * 0.15 : 10),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: ListView(
              children: blogmodelList.map((e) => _buildBlogItem(e)).toList(),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                GradientText(
                  "Let's share experiences, stories, and knowledge together.",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  colors: const [Colors.white, AppTheme.indicatorColor],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  width: 60,
                  child: Divider(
                    thickness: 3,
                    color: AppTheme.indicatorColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Topics',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppTheme.backGroundCardColor.withOpacity(0.2),
                          foregroundColor: AppTheme.indicatorColor),
                      child: const Text(
                        'Flutter',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppTheme.backGroundCardColor.withOpacity(0.2),
                          foregroundColor: AppTheme.indicatorColor),
                      child: const Text(
                        'Life',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBlogItem(BlogModel blogModel) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          blogModel.isSelected = true;
        });
      },
      onExit: (event) {
        setState(() {
          blogModel.isSelected = false;
        });
      },
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              top: blogModel.isSelected ? 0 : 20,
              child: GestureDetector(
                onTap: () {
                  blogModel.url.isNotEmpty
                      ? html.window.open(blogModel.url, blogModel.name)
                      : null;
                },
                child: Container(
                  height: 175,
                  width: width > 600 ? width * 0.4 : width * 0.55,
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: blogModel.isSelected
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
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 100,
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        child: Divider(
                                          thickness: 2,
                                          color: AppTheme.indicatorColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        DateFormat.yMMMMd().format(blogModel.date),
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  blogModel.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: AppTheme.indicatorColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  blogModel.detail,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.asset(
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                  blogModel.image,
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
