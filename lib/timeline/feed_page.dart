import 'package:desafio_flutter_cubos/timeline/widgets/search_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'feed_controller.dart';

class FeedPage extends StatefulWidget {
  final FeedController controller;
  const FeedPage({Key? key, required this.controller}) : super(key: key);
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            collapsedHeight: 190,
            flexibleSpace: FlexibleSpaceBar(
              background: SearchCustom(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Observer(builder: (_) {
                  if (widget.controller.list.results == null) {
                    return const SizedBox.shrink();
                  } else {
                    return GestureDetector(
                      child: Hero(
                        tag: widget.controller.list.results![index].id,
                        child:
                            Text(widget.controller.list.results![index].title),
                      ),
                      onTap: () => Modular.to.pushNamed("/detail",
                          arguments: widget.controller.list.results![index]),
                    );
                  }
                });
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
