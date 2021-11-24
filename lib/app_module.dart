import 'package:desafio_flutter_cubos/timeline/feed_controller.dart';
import 'package:desafio_flutter_cubos/timeline/feed_page.dart';
import 'package:desafio_flutter_cubos/timeline/feed_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'timeline/feed_detail_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Dio()),
        Bind.singleton((i) => TMDBRepository(i<Dio>())),
        Bind.singleton((i) => FeedController(i<Repository>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) =>
                FeedPage(controller: Modular.get<FeedController>())),
        ChildRoute('/detail', child: (context, args) => FeedDetailPage(controller: Modular.get<FeedController>())),
      ];
}
