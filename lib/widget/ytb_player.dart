import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YtbPlayer extends StatefulWidget {
  final String src;
  const YtbPlayer({super.key, required this.src});

  @override
  State<YtbPlayer> createState() => _YtbPlayerState();
}

class _YtbPlayerState extends State<YtbPlayer> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.src,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        strictRelatedVideos: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      key: ValueKey(widget.src),
      controller: _controller,
      aspectRatio: 16 / 9,
    );
  }
}
