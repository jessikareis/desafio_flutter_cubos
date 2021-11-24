import 'dart:convert';

import 'package:dio/dio.dart';

import 'models/http_response_model.dart';
import 'models/movie_detail.dart';
import 'models/movie_list.dart';

abstract class Repository {
  Future<HttpResponseModel> getMovieList();
  Future<HttpResponseModel> getMovieDetail(int id);
}

class TMDBRepository implements Repository {
  final Dio httpClient;
  String pathDetail = "https://api.themoviedb.org/3/movie/";
  String pathList = "https://api.themoviedb.org/3/movie/popular";

  Map<String, dynamic> parameters = {
    "api_key": "f04cc552b2074e05246b939376fdd26d"
  };

  TMDBRepository(this.httpClient);

  @override
  Future<HttpResponseModel> getMovieDetail(int id) async {
    late HttpResponseModel response = HttpResponseModel();

    httpClient.options.headers["Authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMDRjYzU1MmIyMDc0ZTA1MjQ2YjkzOTM3NmZkZDI2ZCIsInN1YiI6IjYxOWFkZjYxMjcxNjcxMDA2NjkyNjVjNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ArDj5_T36uGwJ2mT1ATB7R2El-hCb0H3FWveyEPfD6w";

    try {
      final result =
          await httpClient.get("$pathDetail$id", queryParameters: parameters);

      response.data = MovieDetail.fromJson(result.data);
      response.statusCode = result.statusCode;
      response.message = result.statusMessage;
    } catch (e) {
      response.data = null;
      response.statusCode = 400;
      response.message = "Error ao obter dados";
    }
    return response;
  }

  @override
  Future<HttpResponseModel> getMovieList() async {
    late HttpResponseModel response = HttpResponseModel();

    httpClient.options.headers["Authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMDRjYzU1MmIyMDc0ZTA1MjQ2YjkzOTM3NmZkZDI2ZCIsInN1YiI6IjYxOWFkZjYxMjcxNjcxMDA2NjkyNjVjNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ArDj5_T36uGwJ2mT1ATB7R2El-hCb0H3FWveyEPfD6w";

    try {
      final result =
          await httpClient.get(pathList, queryParameters: parameters);

      response.data = MovieList.fromJson(result.data);
      response.statusCode = result.statusCode;
      response.message = result.statusMessage;
    } catch (e) {
      response.data = null;
      response.statusCode = 400;
      response.message = "Error ao obter dados";
    }
    return response;
  }
}
