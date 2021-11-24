import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  const MovieCard({Key? key, required this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const SizedBox(height: 470, width: 320),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w600_and_h900_face$posterPath',
                ),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      elevation: 1.5,
    );
  }
}
