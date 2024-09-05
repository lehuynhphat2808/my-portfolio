import 'dart:html' as html;
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

String viewID = "your-view-id";

class YtbPlayer extends StatelessWidget {
  final String src;
  const YtbPlayer({super.key, required this.src});

  @override
  Widget build(BuildContext context) {
    final controller = YoutubePlayerController.fromVideoId(
      videoId: src,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        viewID,
        (int id) => html.IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString()
          ..height = MediaQuery.of(context).size.height.toString()
          ..src = src
          ..style.border = 'none');

    return Container(
      child: YoutubePlayer(
        controller: controller,
        aspectRatio: 16 / 9,
      ),
    );
  }
}
