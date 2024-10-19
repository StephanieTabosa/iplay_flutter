import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/utils/status.dart';
import '../../movies_module.dart';
import '../cubits/movies_list_cubit.dart';
import '../atomic/templates/movies_list_template.dart';

class MoviesListPage extends StatefulWidget {
  const MoviesListPage({super.key});

  static const routeName = '/movies-list';
  static const routePath = MoviesModule.routePath + routeName;

  @override
  State<MoviesListPage> createState() => _MoviesListPageState();
}

class _MoviesListPageState extends State<MoviesListPage> {
  late final MoviesListCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = Modular.get<MoviesListCubit>();
    _initialize();
  }

  Future<void> _initialize() async {
    await cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesListCubit, MoviesListState>(
      bloc: cubit,
      builder: (context, state) {
        return MoviesListTemplate(
          movies: state.movies,
          isLoading: state.moviesListStatus.isLoading,
          openDetailsPage: (movieId) => cubit.openDetailsPage(movieId),
          isFavorite: (movieId) => cubit.isFavorite(movieId),
          onFavoriteTap: (movieId) => cubit.onFavoriteTap(movieId),
        );
      },
    );
  }
}
