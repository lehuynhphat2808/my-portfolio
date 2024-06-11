import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../common/theme.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListView(),
        Column(
          children: [
            GradientText(
              "Let's share experiences, stories, and knowledge together.",
              colors: const [Colors.white, AppTheme.indicatorColor],
            ),
          ],
        )
      ],
    );
  }
}
