import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Player extends StatefulWidget {
  const Player({super.key, required this.videoId});

  final String videoId;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: widget.videoId,
    flags: YoutubePlayerFlags(
      autoPlay: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Play"),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(18),
          child: YoutubePlayer(
            controller: _controller,
          ),
        )));
  }
}
