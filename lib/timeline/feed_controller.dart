import 'package:desafio_flutter_cubos/timeline/feed_repository.dart';
import 'package:desafio_flutter_cubos/timeline/models/movie_detail.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'models/http_response_model.dart';
import 'models/movie_list.dart';
part 'feed_controller.g.dart';

class FeedController = _FeedController with _$FeedController;

abstract class _FeedController with Store {
  final Repository repository;
  _FeedController(this.repository);
  @observable
  MovieList list = MovieList();
  @observable
  MovieDetail details = MovieDetail();
  @action
  getMovieDetail(int id) async {
    final HttpResponseModel result = await repository.getMovieDetail(id);
    if (result.statusCode == 200) {
      details = result.data;
    } else {
      debugPrint(result.message);
    }
  }

  @action
  getMovieList() async {
    final HttpResponseModel result = await repository.getMovieList();
    if (result.statusCode == 200) {
      list = result.data;
    } else {
      debugPrint(result.message);
    }
  }
}
