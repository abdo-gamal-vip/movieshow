import 'dart:convert';

class Movie {
  int id;
  String title;
  String poster_path;
  String overview;
  double vote_average;
  Movie({
    this.id = 0,
    this.title = '',
    this.poster_path = '',
    this.overview = '',
    this.vote_average = 0.0,
  });

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'poster_path': poster_path,
      'overview': overview,
      'vote_average': vote_average,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      poster_path: map['poster_path'] ?? '',
      overview: map['overview'] ?? '',
      vote_average: map['vote_average']?.toDouble() ?? 0.0,
    );
  }

 
}
