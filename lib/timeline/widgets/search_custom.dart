import 'package:desafio_flutter_cubos/timeline/shared/design_system.dart';
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
        children: [
          const SizedBox(height: 20),
          Text(
            'Filmes',
            textAlign: TextAlign.left,
            style: AppTypography.h1,
          ),
          const SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              labelText: 'Pesquise aqui',
              labelStyle: AppTypography.searchStyle,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
            ),
          ),
          SizedBox(height: 16),
          Buttons(),
        ],
      ),
    );
  }
}
