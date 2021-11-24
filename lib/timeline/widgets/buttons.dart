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
          borderRadius: BorderRadius.circular(26),
          color: Colors.white38,
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
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
