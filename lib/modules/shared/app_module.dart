import 'package:flutter_modular/flutter_modular.dart';

import '../movies/movies_module.dart';

import 'data/app_network_impl.dart';

class AppModule extends Module {
  AppModule();
  static const routePath = '';

  @override
  List<Bind<Object>> get binds => [
        Bind(
          (i) => const AppNetworkImpl(),
        ),
      ];

  @override
  final List<ModularRoute> routes = [
    RedirectRoute(
      Modular.initialRoute,
      to: MoviesModule.routePath,
    ),
    ModuleRoute(
      MoviesModule.moduleName,
      module: MoviesModule(),
    ),
  ];
}
