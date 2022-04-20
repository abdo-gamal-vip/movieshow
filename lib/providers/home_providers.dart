import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:movieshow/models/movie.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';

class HomeProvider extends ChangeNotifier {
  HomeProvider(){
    getMovies(1);
     getMovies(2);
        getMovies(3);

    notifyListeners();
  }
  final String apikey = "29978f9f030a4e161a6b7edd9a359cf6";

List<Movie> movieList = [];
List<Movie> movieList2 = [];
List<Movie> movieList3 = [];

Future<void> getMovies (int pagenum) async{
var url = Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US&page=$pagenum");
var response = await http.get(url);
var responseBody=jsonDecode(response.body);
print(responseBody["results"][0]["id"]);
if (pagenum==1){
  for (var i in responseBody["results"]){
  movieList.add(Movie.fromMap(i));
 
}
}
if (pagenum==2){
  for (var i in responseBody["results"]){
  movieList2.add(Movie.fromMap(i));
 
}
}
if (pagenum==3){
  for (var i in responseBody["results"]){
  movieList3.add(Movie.fromMap(i));
 
}

}
    notifyListeners();
}
}

