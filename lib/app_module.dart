import 'package:borrowed_things/app_widget.dart';
import 'package:borrowed_things/modules/home/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/domain/usecases/list_things_order_by_return.dart';
import 'modules/home/external/datasource/list_things_datasource_impl.dart';
import 'modules/home/infra/repositories/list_things_repository_impl.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ListThingsDataSourceImpl()),
        Bind((i) => ListThingsRepositoryImpl(i())),
        Bind((i) => ListThingsOrderByReturnImpl(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => HomePage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
