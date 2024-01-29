import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:netflix/core/api.constants.dart';
import 'package:netflix/model/model.dart';
import 'package:http/http.dart' as http;

String upComing =
    "https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiConstants.apikey}";

Future<List<Movie>> getUpcomingmovies() async {
  final responce = await http.get(Uri.parse(upComing));
  if (responce.statusCode == 200) {
    final dataAsJson = jsonDecode(responce.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    return data.movieList;
  } else {
    throw Exception(const Text("Something went Wrong"));
  }
}

String everyOneisWatchingMovies =
    'https://api.themoviedb.org/3/discover/movie?api_key=${ApiConstants.apikey}&with_genres=35';

Future<List<Movie>> getEveryOneISWatching() async {
  final response = await http.get(Uri.parse(everyOneisWatchingMovies));
  if (response.statusCode == 200) {
    final dataAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(dataAsJson['results']);
    return data.movieList;
  } else {
    throw Exception(const Text('SomeThing Went Wrong'));
  }
}
