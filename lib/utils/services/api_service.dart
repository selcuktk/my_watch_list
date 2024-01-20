import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/movie_model.dart';
import '../models/series_model.dart';

class APIService {
  Future<List<ResultSeries>> getRequestedSeries(String endpoint) async {
    final String url = '$baseUrl${seriesEndpointMap[endpoint]}?api_key=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<ResultSeries> series = [];
      final Map<String, dynamic> responseList = jsonDecode(response.body);
      for (var i = 0; i < responseList['results'].length; i++) {
        series.add(ResultSeries.fromJson(responseList['results'][i]));
      }
      final random10 = series.sample(10);
      return random10;
    } else {
      throw Exception();
    }
  }

  Future<List<ResultMovies>> getRequestedMovies(String endpoint) async {
    final String url = '$baseUrl${movieEndpointMap[endpoint]}?api_key=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<ResultMovies> movies = [];
      final Map<String, dynamic> responseList = jsonDecode(response.body);
      for (var i = 0; i < responseList['results'].length; i++) {
        movies.add(ResultMovies.fromJson(responseList['results'][i]));
      }
      final random10 = movies.sample(10);
      return random10;
    } else {
      throw Exception();
    }
  }

  Future<List<ResultSeries>> searchSeries(String userInput) async {
    final String url = '$baseUrl/search/tv?query=$userInput&include_adult=true&language=en-US&page=1&api_key=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<ResultSeries> series = [];
      final Map<String, dynamic> responseList = jsonDecode(response.body);
      for (var i = 0; i < responseList['results'].length; i++) {
        series.add(ResultSeries.fromJson(responseList['results'][i]));
      }
      final List<ResultSeries> resultList = series.sublist(0, series.length > 5 ? 5 : series.length);
      return resultList;
    } else {
      throw Exception();
    }
  }

  Future<List<ResultMovies>> searchMovie(String userInput) async {
    final String url = '$baseUrl/search/movie?query=$userInput&include_adult=true&language=en-US&page=1&api_key=$apiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<ResultMovies> movies = [];
      final Map<String, dynamic> responseList = jsonDecode(response.body);
      for (var i = 0; i < responseList['results'].length; i++) {
        movies.add(ResultMovies.fromJson(responseList['results'][i]));
      }
      final List<ResultMovies> resultList = movies.sublist(0, movies.length > 5 ? 5 : movies.length);
      return resultList;
    } else {
      throw Exception();
    }
  }
}
