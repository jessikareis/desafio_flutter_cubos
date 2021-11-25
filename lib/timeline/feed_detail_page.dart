import 'package:desafio_flutter_cubos/timeline/feed_controller.dart';
import 'package:desafio_flutter_cubos/timeline/models/movie_detail.dart';
import 'package:desafio_flutter_cubos/timeline/shared/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/movie_card.dart';

class FeedDetailPage extends StatefulWidget {
  final FeedController controller;
  const FeedDetailPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<FeedDetailPage> createState() => _FeedDetailPageState();
}

class _FeedDetailPageState extends State<FeedDetailPage> {
  late MovieDetail detail;

  @override
  void initState() {
    super.initState();
    detail = Modular.args.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BackButton(),
            Hero(
              tag: detail.id ?? '',
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: MovieCard(
                  posterPath: detail.posterPath ?? '',
                  height: 318,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NotaWidget(voteAverage: detail.voteAverage ?? 0.0),
              ],
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TituloOriginal(detail: detail),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PilulaWidget(
                    descricao: "Ano: ", valor: "${detail.releaseDate?.year}"),
                const SizedBox(width: 16),
                PilulaWidget(
                    descricao: "Duração: ", valor: "${detail.runtime} min"),
              ],
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 32,
              child: Center(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: detail.genres?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: PilulaSimplesWidget(
                            descricao: detail.genres![index].name),
                      );
                    }),
              ),
            ),
            const SizedBox(height: 56),
            DescricaoWidget(descricao: detail.overview ?? ''),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PilulaWidget(
                descricao: "ORÇAMENTO: ",
                valor: "\$ ${detail.budget}",
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PilulaWidget(
                descricao: "PRODUTORAS: ",
                valor: detail.productionCompanies![0].name,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}

class DescricaoWidget extends StatelessWidget {
  final String descricao;

  const DescricaoWidget({
    Key? key,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Descrição"),
          Text(
            descricao,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class PilulaSimplesWidget extends StatelessWidget {
  final String descricao;

  const PilulaSimplesWidget({
    Key? key,
    required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(
        descricao,
        style: const TextStyle(color: AppColors.grey2),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey,
          )),
    );
  }
}

class PilulaWidget extends StatelessWidget {
  final String descricao;
  final String valor;
  final double? width;

  const PilulaWidget({
    Key? key,
    required this.descricao,
    required this.valor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(descricao, style: const TextStyle(color: AppColors.grey2)),
          Text(
            valor,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.grey1),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: AppColors.borderButtons,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class TituloOriginal extends StatelessWidget {
  const TituloOriginal({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final MovieDetail detail;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Text("Título original: "),
      Text(
        "${detail.originalTitle}",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ]);
  }
}

class NotaWidget extends StatelessWidget {
  final double voteAverage;

  const NotaWidget({
    Key? key,
    required this.voteAverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text("$voteAverage"),
      const Text("/10"),
    ]);
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        onPressed: () => Modular.to.pop(),
        child: const Text(
          "<   Voltar",
          style: TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
