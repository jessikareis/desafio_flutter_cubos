import 'package:desafio_flutter_cubos/timeline/feed_repository.dart';
import 'package:desafio_flutter_cubos/timeline/widgets/movie_card.dart';
import 'package:desafio_flutter_cubos/timeline/widgets/search_custom.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

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
                    Repository repo = TMDBRepository();
                    var result = repo.getMovieDetail(566525);
                  },
                  child: const Text("teste"))
            ],
          );
        },
      ),
    );
  }
}
