import 'package:desafio_flutter_cubos/timeline/feed_controller.dart';
import 'package:desafio_flutter_cubos/timeline/models/movie_detail.dart';
import 'package:desafio_flutter_cubos/timeline/shared/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'models/movie_list.dart';

class FeedDetailPage extends StatefulWidget {
  final FeedController controller;
  const FeedDetailPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<FeedDetailPage> createState() => _FeedDetailPageState();
}

class _FeedDetailPageState extends State<FeedDetailPage> {
  late MovieDetail detail;
  @override
  void initState() {
    super.initState();
    Movie movie = Modular.args.data;
    widget.controller.getMovieDetail(movie.id);
    detail = widget.controller.details;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Observer(builder: (_) {
            return Text(detail.originalTitle ?? '');
          }),
        ),
        body: Hero(
          tag: detail.id ?? '',
          child:
              Center(child: Text(detail.title ?? '', style: AppTypography.h1)),
        ));
  }
}
