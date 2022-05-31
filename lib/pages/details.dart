import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieshow/constants.dart';
import 'package:movieshow/widgets/best_movies.dart';
import 'package:movieshow/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Details extends StatefulWidget {
  const Details({
    Key? key,
    required this.id,
    required this.overView,
    required this.poster,
    required this.title,
  }) : super(key: key);
  final String id;
  final String title;
  final String poster;
  final String overView;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  YoutubePlayerController? youtubePlayerController;
  @override
  void initState() {
    youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
            "https://www.youtube.com/watch?v=${widget.id}")!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          isLive: false,
          loop: false,
        ));
    super.initState();
  }

  @override
  void deactivate() {
    youtubePlayerController!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    youtubePlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgound,
        elevation: 0,
        title: Text(
          "movies",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: backgound,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "http://image.tmdb.org/t/p/w600_and_h900_bestv2${widget.poster}"),
                    fit: BoxFit.fill)),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 230,
                  width: 390,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Watch Trailer",
                          style: TextStyle(color: fontColor, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 340,
                        height: 180,
                        child: YoutubePlayer(
                          controller: youtubePlayerController!,
                          onReady: () {
                            youtubePlayerController!.play();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.title,
                    style: const TextStyle(color: fontColor, fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Text(widget.overView,
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: fontColor, fontSize: 18)),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            launch("https://iegybest.co/find/?q=${widget.title}");
          },
          backgroundColor: primaryColor,
          label: Text("Search in egy best")),
    );
  }
}
