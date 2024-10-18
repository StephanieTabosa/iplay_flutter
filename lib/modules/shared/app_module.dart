import 'package:flutter_modular/flutter_modular.dart';

import '../movies/movies_module.dart';

class AppModule extends Module {
  AppModule();
  static const routePath = '';

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
