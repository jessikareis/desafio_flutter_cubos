import 'dart:convert';

import 'package:dio/dio.dart';

import 'models/movie_detail.dart';
import 'models/movie_list.dart';

abstract class Repository {
  List<Movie> getMovieList();
  Future<MovieDetail> getMovieDetail(int id);
}

class TMDBRepository implements Repository {
  @override
  Future<MovieDetail> getMovieDetail(int id) async {
    late MovieDetail detail;

    Dio httpClient = Dio();
    httpClient.options.headers["Authorization"] =
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMDRjYzU1MmIyMDc0ZTA1MjQ2YjkzOTM3NmZkZDI2ZCIsInN1YiI6IjYxOWFkZjYxMjcxNjcxMDA2NjkyNjVjNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ArDj5_T36uGwJ2mT1ATB7R2El-hCb0H3FWveyEPfD6w";

    const path = "https://api.themoviedb.org/3/movie/566525";
    final Map<String, dynamic> parameters = {
      "api_key": "f04cc552b2074e05246b939376fdd26d"
    };

    try {
      final result = await httpClient.get(path, queryParameters: parameters);

      detail = MovieDetail.fromJson(result.data);
    } catch (e) {
      detail = MovieDetail();
      print(e);
    } finally {
      return detail;
    }
  }

  @override
  List<Movie> getMovieList() {
    // TODO: implement getMovieList
    throw UnimplementedError();
  }
}
