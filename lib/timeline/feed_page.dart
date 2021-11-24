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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 18,
        itemBuilder: (context, index) {
          return Column(
            children: [
              index == 0 ? const SearchCustom() : const SizedBox(),
              MovieCard(),
              ElevatedButton(
                  onPressed: () {
                   
                    var result = controller.getMovieDetail(566525);
                  },
                  child: const Text("Details")),
              ElevatedButton(
                  onPressed: () {
                   
                    var result = controller.getMovieList();
                  },
                  child: const Text("List"))
            ],
          );
        },
      ),
    );
  }
}
