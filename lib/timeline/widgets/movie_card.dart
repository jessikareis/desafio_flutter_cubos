import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  const MovieCard({Key? key, required this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 470,
          width: MediaQuery.of(context).size.width * 0.90,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: NetworkImage(
                'https://image.tmdb.org/t/p/w220_and_h330_face$posterPath',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
