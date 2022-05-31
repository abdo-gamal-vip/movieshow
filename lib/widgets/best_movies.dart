import 'package:flutter/material.dart';

import '../constants.dart';
import '../helper.dart';

class BestMovieWid extends StatelessWidget {
  const BestMovieWid(
      {Key? key,
      required this.size,
      required this.name,
      required this.poster,
      required this.rate,
      required this.len})
      : super(key: key);

  final Size size;
  final String name;
  final String poster;
  final double rate;
  final List len;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.3,
      width: size.width * 0.3,
      margin: EdgeInsets.all(5),
      child: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            len.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: size.height * 0.2,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://image.tmdb.org/t/p/w600_and_h900_bestv2$poster"),
                          fit: BoxFit.cover),
                    )),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                cuttitle(name.toString()),
                style: TextStyle(fontSize: 18, color: fontColor),
              ),
            )
          ]),
          Positioned(
            child: Container(
              height: size.height * 0.06,
              width: size.width * 0.1,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(20)),
                  color: primaryColor.withOpacity(0.7)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  rate.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: fontColor),
                ),
              ),
            ),
            top: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}
