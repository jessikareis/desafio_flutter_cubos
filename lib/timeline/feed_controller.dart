import 'package:desafio_flutter_cubos/timeline/feed_repository.dart';
import 'package:desafio_flutter_cubos/timeline/models/movie_detail.dart';

import 'models/http_response_model.dart';
import 'models/movie_list.dart';

class FeedController {
  final Repository repository;

  MovieDetail details = MovieDetail();
  MovieList list = MovieList();

  FeedController(this.repository);

  getMovieDetail(int id) async {
    final HttpResponseModel result = await repository.getMovieDetail(id);
    if (result.statusCode == 200) {
      details = result.data;
      print(details);
    } else {
      print(result.message);
    }
  }

  getMovieList() async {
    final HttpResponseModel result = await repository.getMovieList();
    if (result.statusCode == 200) {
      list = result.data;
      print(list);
    } else {
      print(result.message);
    }
  }
}
