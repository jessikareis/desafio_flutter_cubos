import 'package:desafio_flutter_cubos/timeline/feed_repository.dart';
import 'package:desafio_flutter_cubos/timeline/widgets/movie_card.dart';
import 'package:desafio_flutter_cubos/timeline/widgets/search_custom.dart';
import 'package:flutter/material.dart';

import 'feed_controller.dart';

class FeedPage extends StatelessWidget {
  final FeedController controller;
  const FeedPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            collapsedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              background: SearchCustom(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return MovieCard();
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
