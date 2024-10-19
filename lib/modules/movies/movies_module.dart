import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

import '../shared/app_module.dart';
import 'data/datasources/movies_datasource_impl.dart';
import 'data/hive/favorites_movies_box_handler.dart';
import 'data/repositories/movies_repository_impl.dart';

import 'movies_navigator.dart';
import 'presentation/cubits/movies_details_cubit.dart';
import 'presentation/cubits/movies_home_cubit.dart';
import 'presentation/pages/movies_details_page.dart';
import 'presentation/pages/movies_home_page.dart';

import 'presentation/cubits/movies_list_cubit.dart';

import 'presentation/pages/movies_list_page.dart';

class MoviesModule extends Module {
  static const moduleName = '/movies';
  static const routePath = AppModule.routePath + moduleName;

  @override
  List<Bind<Object>> get binds => [
        // Dio
        Bind.singleton((i) => Dio()),

        // Navigator
        Bind((i) => const MoviesNavigator()),

        // Hive
        Bind((i) => FavoritesMoviesBoxHandler()),

        // Datasources
        Bind(
          (i) => MoviesDatasourceImpl(
            dio: i(),
            network: i(),
          ),
        ),

        // Repositories
        Bind((i) => MoviesRepositoryImpl(moviesDatasource: i())),

        // Cubits
        Bind(
          (i) => MoviesHomeCubit(
            moviesNavigator: i(),
          ),
        ),
        BlocBind.factory(
          (i) => MoviesListCubit(
            getMoviesListUsecase: i(),
            moviesNavigator: i(),
            favoritesMoviesBoxHandler: i(),
          ),
        ),
        BlocBind.factory(
          (i) => MoviesDetailsCubit(
            movies: i.args.data,
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          MoviesModule.routePath,
          to: MoviesHomePage.routePath,
        ),
        ChildRoute(
          MoviesHomePage.routeName,
          child: (context, args) => const MoviesHomePage(),
        ),
        ChildRoute(
          MoviesListPage.routeName,
          child: (context, args) => const MoviesListPage(),
        ),
        ChildRoute(
          MoviesDetailsPage.routeName,
          child: (context, args) => const MoviesDetailsPage(),
        ),
      ];
}
