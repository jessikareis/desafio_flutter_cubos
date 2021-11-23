import 'package:desafio_flutter_cubos/timeline/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SearchCustom extends StatelessWidget {
  const SearchCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(height: 20),
          Text(
            'Filmes',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.search),
              labelText: 'Pesquise aqui',
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          Buttons(),
        ],
      ),
    );
  }
}
