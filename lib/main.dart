import 'package:flutter/material.dart';
import 'package:movieshow/pages/Home.dart';
import 'package:movieshow/pages/details.dart';
import 'package:movieshow/providers/home_providers.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (context) => HomeProvider(),)],
    child: MaterialApp(
    title: "MoviesShow",
      
      home: Details(),),
  ));
}

