import 'package:desafio_flutter_cubos/timeline/shared/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'models/movie_list.dart';

class FeedDetailPage extends StatelessWidget {
  const FeedDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Movie movie = Modular.args.data;
    debugPrint(movie.toString());
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: Hero(
          tag: movie.id,
          child: Center(child: Text(movie.title, style: AppTypography.h1)),
        ));
  }
}
