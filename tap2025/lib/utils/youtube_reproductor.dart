import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeReproductor extends StatefulWidget {
  final String idVideo;
  const YoutubeReproductor({super.key, required this.idVideo});

  @override
  State<YoutubeReproductor> createState() => _YoutubeReproductorState();
}

class _YoutubeReproductorState extends State<YoutubeReproductor> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.idVideo,
      flags: YoutubePlayerFlags(autoPlay: true, mute: false, loop: true),
    );
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }
}
