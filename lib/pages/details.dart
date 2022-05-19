import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieshow/constants.dart';
import 'package:movieshow/widgets/best_movies.dart';
import 'package:movieshow/main.dart';

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
                        "https://lumiere-a.akamaihd.net/v1/images/p_blackwidow_21043_v2_6d1b73b8.jpeg"),
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.title,
                    style: const TextStyle(color: fontColor, fontSize: 18)),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.overView,
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: fontColor, fontSize: 18)),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
