import 'package:desafio_flutter_cubos/timeline/shared/design_system.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttonOptions(String title) {
      return Container(
        height: 24,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderButtons),
          borderRadius: BorderRadius.circular(26),
        ),
        child: Text(
          title,
          style: AppTypography.buttonStyle,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buttonOptions('Ação'),
        buttonOptions('Aventura'),
        buttonOptions('Fantasia'),
        buttonOptions('Comédia'),
      ],
    );
  }
}
