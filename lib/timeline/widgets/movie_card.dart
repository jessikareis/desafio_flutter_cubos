import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        const SizedBox(
          height: 470 ,
          width: 320
        ),
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            /*image: DecorationImage(
              image: NetworkImage(),
            fit: BoxFit.cover,
            ),*/
          ),
        )
      ],
      ),
      elevation: 1.5,
    );
  }
}